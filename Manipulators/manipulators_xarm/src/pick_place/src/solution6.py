#!/usr/bin/env python
import rospy
import sys
import tf_conversions
import tf2_ros
import moveit_commander
import moveit_msgs.msg
from moveit_commander.conversions import pose_to_list
from geometry_msgs.msg import PoseStamped, Pose
from path_planner.srv import *
from tf.transformations import *


class Planner():

  def __init__(self):
    # Initialisation
    moveit_commander.roscpp_initialize(sys.argv)
    self.robot = moveit_commander.RobotCommander()
    self.scene = moveit_commander.PlanningSceneInterface()
    self.group_name = "xarm6"
    self.group = moveit_commander.MoveGroupCommander(self.group_name)
    self.link_ee = self.group.get_end_effector_link()

  def wait_for_state_update(self,box_name, box_is_known=False, box_is_attached=False, timeout=4):

    # We need to make sure that the scene is updated properly so we'll need to check it whenever we change something
    scene = self.scene

    start = rospy.get_time()
    seconds = rospy.get_time()
    while (seconds - start < timeout) and not rospy.is_shutdown():
      attached_objects = scene.get_attached_objects([box_name])
      is_attached = len(attached_objects.keys()) > 0

      is_known = box_name in scene.get_known_object_names()

      if (box_is_attached == is_attached) and (box_is_known == is_known):
        return True

      rospy.sleep(0.1)
      seconds = rospy.get_time()
    return False

  def goToPose(self,pose_goal):

    # Code used to move to a given position using move it
    aux = Pose()
    aux.orientation.x = 1
    aux.position = pose_goal.transform.translation
    aux.position.z
    print(aux)
    self.group.set_pose_target(aux)
    self.group.go(wait=True)
    self.group.stop()
    self.group.clear_pose_targets()

  def addObstacles(self):

    # Code used to add obstacles in the environtment

    targets = ["RedBox",
               "BlueBox",
               "GreenBox",
               "DepositBox"]

    for target in targets:
      tfBuffer = tf2_ros.Buffer()
      listener = tf2_ros.TransformListener(tfBuffer)
      pose = tfBuffer.lookup_transform(target, "world",  rospy.Time(), rospy.Duration(1.0))
      box_pose = PoseStamped()
      box_pose.header.frame_id = self.robot.get_planning_frame()
      box_pose.pose.position.x = -pose.transform.translation.y
      box_pose.pose.position.y = pose.transform.translation.x
      box_name = target + "_planner"

      while not self.wait_for_state_update(box_name, box_is_known=True, timeout=1.0):

        if not target == targets[-1]:
          print(box_name)
          box_pose.pose.position.z += 0.08/2
          self.scene.add_box(box_name, box_pose, size=(0.08, 0.08, 0.08))
        else:
          print(box_name)
          box_pose.pose.position.z += 0.15/ 2
          self.scene.add_box(box_name, box_pose, size=(0.5, 0.25, 0.15))

  def detachBox(self,box_name):

    self.scene.remove_attached_object(self.link_ee, name=box_name + "_planner")

    return self.wait_for_state_update(box_name, box_is_known=True, box_is_attached=False)


  def attachBox(self,box_name):

    grasping_group = 'vacuum_gripper'
    touch_links = self.robot.get_link_names(group=grasping_group)
    self.scene.attach_box(self.link_ee, box_name + "_planner", touch_links=touch_links)

    return self.wait_for_state_update(box_name, box_is_attached=True, box_is_known=False)

class myNode():
  def __init__(self):
    rospy.init_node('Manipulator')
    rospy.wait_for_service('RequestGoal')
    self.goal_handler = rospy.ServiceProxy('RequestGoal', RequestGoal)
    rospy.wait_for_service('AttachObject')
    self.attach_handler = rospy.ServiceProxy('AttachObject', AttachObject)

    print("init done")

  def getGoal(self,action):

      try:
        resp = self.goal_handler(action)
        return resp.goal, resp.status
      except rospy.ServiceException as e:
        print("Service call failed: %s" % e)

  def AttachObject(self,frame ,action):

      try:
        resp = self.attach_handler(action, frame)
        if action:
          self.planner.attachBox(frame)
        else:
          self.planner.detachBox(frame)
        return  resp.status

      except rospy.ServiceException as e:
        print("Service call failed: %s" % e)

  def tf_goal(self, goal):

    tfBuffer = tf2_ros.Buffer()
    listener = tf2_ros.TransformListener(tfBuffer)
    pose = tfBuffer.lookup_transform("link_base", goal, rospy.Time(),rospy.Duration(0.5))

    return pose

  def main(self):

    self.planner = Planner()
    self.planner.addObstacles()
    name, status = self.getGoal("pick")
    target = self.tf_goal(name)
    print("beg move")
    target.transform.translation.z += 0.15
    # raw_input()
    self.planner.goToPose(target)
    print("Object attached?")
    print(name)
    print( self.AttachObject(name, True))
    # # raw_input()
    name_place, status = self.getGoal("place")
    target = self.tf_goal(name_place)
    target.transform.translation.z += 0.3
    print(target)
    self.planner.goToPose(target)
    print(self.AttachObject(name, False))




if __name__ == '__main__':
  try:
    node = myNode()
    node.main()

  except rospy.ROSInterruptException:
    pass
