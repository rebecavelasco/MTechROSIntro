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
                        "DepositBox"]

        self.targets_place = ["DepositBox"]

        self.targets_pick = ["RedBox",
                             "BlueBox",
                             "GreenBox"]

        # Variables used to iterate through the targets
        self.task_id = 0
        self.place_id = 0
        self.target_pose = PoseStamped()
        self.status = 0
        self.base_updated = 0

        self.attached = {"RedBox": False,
                         "BlueBox": False,
                         "GreenBox": False,
                         "None": False}
        self.frame = "None"

        # Transform handlers
        self.br = tf2_ros.TransformBroadcaster()
        self.brStatic = tf2_ros.StaticTransformBroadcaster()

        # Service publisher
        rospy.Service('RequestGoal', RequestGoal, self.sendGoal)

        # We want to wait until Gazebo services are up before continuing with the code
        rospy.wait_for_service('/gazebo/set_link_state')
        rospy.Service('AttachObject', AttachObject, self.AttachObject)

        # Add tf2 handlers
        self.tfBuffer = tf2_ros.Buffer()
        self.listener = tf2_ros.TransformListener(self.tfBuffer)

        # Add publishers and subscribers
        self.pub = rospy.Publisher('/gazebo/set_model_state', ModelState, queue_size=10)
        rospy.Subscriber("gazebo/model_states", ModelStates, self.callback)

        t = TransformStamped()
        t.header.stamp = rospy.Time.now()
        t.header.frame_id = "link_tcp"
        t.child_frame_id = "link_attach"
        t.transform.translation.z = 0.13 # Distance to be tuned manually so that collisions are prevented calibrate to improve the visuals
        t.transform.rotation.w = 1
        self.brStatic.sendTransform(t)


    def AttachObject(self, data):

        # Function to attach the object, basically the box will follow the ee with a certain offset
        self.frame = data.frame
        self.attached[self.frame] = data.action
        self.object = data.frame
        return AttachObjectResponse(True)

    def main(self):

        rate = rospy.Rate(400)
        # If there's an object attached to the ee we want it to follow its trajectory
        while not rospy.is_shutdown():

            if self.attached[self.frame]:

                tf = self.tfBuffer.lookup_transform( "sensor_frame", self.frame, rospy.Time(), rospy.Duration(0.5))
                aux_model = ModelState()

                aux_model.model_name = self.object
                aux_model.pose.position.x = tf.transform.translation.x
                aux_model.pose.position.y = tf.transform.translation.y
                aux_model.pose.position.z = tf.transform.translation.z
                aux_model.pose.orientation = tf.transform.rotation

                self.pub.publish(aux_model)

            rate.sleep()

    def callback(self, data):

        # Map Gazebo and TF
        aux_idx = data.name.index(self.targets[self.task_id])
        self.target_pose.pose = data.pose[aux_idx]

        # We uptdate tf2 frames so that they have the same postiion as in Gazebo, if the object is attached we will keep
        # the same position relative to the ee.
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
                # print("Attached")
                tf = self.tfBuffer.lookup_transform("sensor_frame", "link_attach", rospy.Time(), rospy.Duration(0.5))
                tf.child_frame_id = target
                tf.header.stamp = rospy.Time.now()
                self.br.sendTransform(tf)


    def sendGoal(self,req):

        # Proposed state machine to control the goals (currently 1)
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

    try:
        aux = StateGatherer()
        aux.main()

    except rospy.ROSInterruptException:
        pass
