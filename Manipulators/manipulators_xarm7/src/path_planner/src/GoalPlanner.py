#!/usr/bin/env python
import rospy
import tf2_ros
import numpy as np
from geometry_msgs.msg import PoseStamped,TransformStamped
from gazebo_msgs.msg import ModelState,ModelStates
from path_planner.srv import RequestGoal,RequestGoalResponse,AttachObject,AttachObjectResponse

class StateGatherer():
    def __init__(self):

	# We set up the names of each of the target frames that we want to pick or place 
        rospy.init_node('TaskPlanner')

        self.targets = ["RedBox",
                        "BlueBox",
                        "GreenBox",
                        "DepositBoxGreen"]

        self.targets_place = ["DepositBoxGreen"]

        self.targets_pick = ["RedBox",
                             "BlueBox",
                             "GreenBox"]

        self.task_id = 0
        self.place_id = 0
        self.target_pose = PoseStamped()
        self.status = 0
        self.base_updated = 0

        self.br = tf2_ros.TransformBroadcaster()
        self.brStatic = tf2_ros.StaticTransformBroadcaster()

        rospy.Service('RequestGoal', RequestGoal, self.sendGoal)

        rospy.wait_for_service('/gazebo/set_link_state')
        rospy.Service('AttachObject', AttachObject, self.AttachObject)
        self.tfBuffer = tf2_ros.Buffer()
        self.listener = tf2_ros.TransformListener(self.tfBuffer)
        self.pub = rospy.Publisher('/gazebo/set_model_state', ModelState, queue_size=10)
        self.attached = {"RedBox" : False,
                        "BlueBox" : False,
                        "GreenBox": False,
                        "None": False}
        self.frame = "None"
        rospy.Subscriber("gazebo/model_states", ModelStates, self.callback)


    def AttachObject(self, data):
        self.tf = self.tfBuffer.lookup_transform("link_eef", data.frame, rospy.Time(), rospy.Duration(0.5))
        self.frame = data.frame
        self.attached[self.frame] = data.action
        self.object = data.frame
        return AttachObjectResponse(True)

    def main(self):

        rate = rospy.Rate(200)
        while not rospy.is_shutdown():

            if self.attached[self.frame]:

                tf = self.tfBuffer.lookup_transform( "sensor_frame", self.frame, rospy.Time(), rospy.Duration(0.5))
                aux_model = ModelState()

                aux_model.model_name = self.object
                aux_model.pose.position.x = tf.transform.translation.x
                aux_model.pose.position.y = tf.transform.translation.y
                aux_model.pose.position.z = tf.transform.translation.z + 0.025
                aux_model.pose.orientation = tf.transform.rotation

                self.pub.publish(aux_model)

            rate.sleep()

    def callback(self, data):

        # Map Gazebo and TF
        aux_idx = data.name.index(self.targets[self.task_id])
        self.target_pose.pose = data.pose[aux_idx]

        for target in self.targets:

            if (target != self.frame) or not (self.attached[target]):
                aux_idx = data.name.index(target)
                t = TransformStamped()
                t.header.stamp = rospy.Time.now()
                t.header.frame_id = "sensor_frame"
                t.child_frame_id = target
                t.transform.translation = data.pose[aux_idx].position
                t.transform.rotation = data.pose[aux_idx].orientation
                self.br.sendTransform(t)

            else:
                self.tf.header.stamp = rospy.Time.now()
                self.br.sendTransform(self.tf)


    def sendGoal(self,req):

        # Proposed state machine to control the goals (currently 1 )
        if req.action == "place":
            if self.status == 1:
                aux_pose = self.targets_place[self.place_id]
                self.place_id += 1
                status = True
            else:
                aux_pose = "None, invalid place request! "
                status = False
                
            print(aux_pose)
            return RequestGoalResponse(aux_pose,status)

        elif req.action == "pick":
            if self.status == 0:

                aux_pose = self.targets_pick[self.task_id]
                status = True
                self.status = 1
            else:
                aux_pose = "None, invalid pick request! "
                status = False

            print("target: " + aux_pose)
            return RequestGoalResponse(aux_pose,status)

if __name__ == '__main__':
    aux = StateGatherer()
    aux.main()
