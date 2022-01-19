#!/usr/bin/env python
import cv2 # Import the OpenCV library to enable computer vision
import numpy as np # Import the NumPy scientific computing library
import rospy, cv_bridge
from rospy.timer import TimerEvent
from sensor_msgs.msg import Image
from std_msgs.msg import Bool

class ImageProcessing:
    def __init__(self):
        self.bridge = cv_bridge.CvBridge()

        self.image_sub = rospy.Subscriber('/camera_image',
                Image, self.image_callback) 

        self.image_pub = rospy.Publisher('detected',
            Image, queue_size=10)

        self.red_pub = rospy.Publisher('/red',Bool,queue_size=1)
        self.image = None
        rate = rospy.Rate(30)
        while not rospy.is_shutdown():
            self.run()
            rate.sleep()

    def image_callback(self, msg):
        self.image = self.bridge.imgmsg_to_cv2(msg,desired_encoding='bgr8')	

    def run(self):
        if self.image is None:
            return
        src_frame = self.image

        hsv1 = cv2.cvtColor(src_frame,cv2.COLOR_BGR2HSV)
        hsv2 = cv2.cvtColor(src_frame,cv2.COLOR_BGR2HSV)

        lower_red1 = np.array([0,70,50])
        upper_red1 = np.array([10,255,255])
        
        lower_red2 = np.array([170,70,50])
        upper_red2 = np.array([180,255,255])
	

        red_mask1 = cv2.inRange(hsv1,lower_red1,upper_red1)
        red_mask2 = cv2.inRange(hsv2,lower_red2,upper_red2)
	
        result = np.count_nonzero(red_mask1) + np.count_nonzero(red_mask2)

        red = cv2.bitwise_and(src_frame,src_frame,mask=red_mask1)

        output = self.bridge.cv2_to_imgmsg(red)

        self.image_pub.publish(output)

        msg = Bool()

        if result > 10000:
            msg.data = True
        else:
            msg.data = False
        
        self.red_pub.publish(msg)
            

rospy.init_node('Colour')

try:
    follower = ImageProcessing()
except rospy.ROSInterruptException:
    None
