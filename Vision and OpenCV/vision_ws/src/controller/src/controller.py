#!/usr/bin/env python
import rospy

from std_msgs.msg import Float32
from std_msgs.msg import Bool
from geometry_msgs.msg import Twist

class controller:
	def __init__(self):
		self.offset = 0.0
		self.red = False
		self.offset_sub = rospy.Subscriber('/offset',Float32,self.offset_callback)
		self.red_sub = rospy.Subscriber('/red',Bool,self.red_callback)
		self.cmd_vel_pub = rospy.Publisher('/cmd_vel',Twist,queue_size=1)
		
		self.Kp = -0.0008
		
		self.run()
	
	def offset_callback(self,msg):
		self.offset = msg.data

	def red_callback(self,msg):
		self.red = msg.data

	def run(self):
		
		rospy.init_node('controller')
		current_time = rospy.get_time()
		last_time = current_time

		rate = rospy.Rate(30)
		msg = Twist()
		msg.linear.x = 0
		msg.linear.y = 0
		msg.linear.z = 0
		msg.angular.x = 0
		msg.angular.y = 0
		msg.angular.z = 0
		self.cmd_vel_pub.publish(msg)

		
		while not rospy.is_shutdown():
			current_time = rospy.get_time()
			dt = (current_time - last_time)
			last_time = current_time
			turn = self.Kp * self.offset
			msg.angular.z = turn
			if self.red:
				msg.linear.x = 0
				msg.angular.z = 0
			else:
				msg.linear.x = 0.05
	
			self.cmd_vel_pub.publish(msg)
			rate.sleep()

if __name__ == "__main__":
	ctrl = controller()
