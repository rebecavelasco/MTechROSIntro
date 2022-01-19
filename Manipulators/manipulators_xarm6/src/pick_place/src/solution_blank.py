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
    moveit_commander.roscpp_initialize(sys.argv)
    self.robot = moveit_commander.RobotCommander()
    self.scene = moveit_commander.PlanningSceneInterface()
    self.group_name = "xarm7"
    self.group = moveit_commander.MoveGroupCommander(self.group_name)
    self.link_ee = self.group.get_end_effector_link()

  def wait_for_state_update(self, box_is_known=False, box_is_attached=False, timeout=4):

    box_name = "box"
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

    aux = Pose()
    aux.orientation.x = 1
    aux.position = pose_goal.transform.translation
    aux.position.z += 0.1
    print(aux)

    # TODO: use the moveit group to move the robot to the goal position (functions called in self.group.X)


  def addObstacles(self):

    targets = ["RedBox",
               "BlueBox",
               "GreenBox",
               "DepositBoxGreen"]

    for target in targets:
      tfBuffer = tf2_ros.Buffer()
      listener = tf2_ros.TransformListener(tfBuffer)
      pose = tfBuffer.lookup_transform(target, "world",  rospy.Time(), rospy.Duration(0.5))
      box_pose = PoseStamped()
      box_pose.header.frame_id = self.robot.get_planning_frame()
      box_pose.pose.position.x = -pose.transform.translation.y
      box_pose.pose.position.y = pose.transform.translation.x
      box_name = target + "_planner"


      if not target == targets[-1]:
        box_pose.pose.position.z += 0.1/2
        print(box_name)
        # TODO: Add a box in the scene of shape 0.1,0.1,0.1 its name is stored in box_name and its position in box_pose

      else:
        box_pose.pose.position.z += 0.15/ 2
        # TODO: Add a box in the scene of shape 0.5, 0.25, 0.15 its name is stored in box_name and its position in box_pose

      self.wait_for_state_update(box_is_known=True, timeout=0.1)

  def detachBox(self,box_name):

    self.scene.remove_attached_object(self.link_ee, name=box_name + "_planner")

    return self.wait_for_state_update(box_is_known=True, box_is_attached=False)


  def attachBox(self,box_name):

    grasping_group = 'vacuum_gripper'
    touch_links = self.robot.get_link_names(group=grasping_group)
    self.scene.attach_box(self.link_ee, box_name + "_planner", touch_links=touch_links)

    return self.wait_for_state_update(box_is_attached=True, box_is_known=False)

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

    #TODO: Goal is a fram with respect to the world, so we need to express it wrt the robot base "link_base" using tf2

    return pose

  def main(self):

    self.planner = Planner()
    self.planner.addObstacles()

    name, status = self.getGoal("pick")
    target = self.tf_goal(name)
    print("beg move")

    target.transform.translation.z += 0.05
    self.planner.goToPose(target)
    print("Object attached?")
    print(name)
    print( self.AttachObject(name, True))

    self.planner.goToPose(target)
    name_place, status = self.getGoal("place")
    target = self.tf_goal(name_place)
    target.transform.translation.z += 0.2

    self.planner.goToPose(target)
    print(self.AttachObject(name, False))




if __name__ == '__main__':
  try:
    print("Hello")
    node = myNode()
    node.main()
  except rospy.ROSInterruptException:
    None
