#!/usr/bin/env python
import cv2 # Import the OpenCV library to enable computer vision
import numpy as np # Import the NumPy scientific computing library
import rospy, cv_bridge
from sensor_msgs.msg import Image
from std_msgs.msg import Float32


class Lane:
    def __init__(self):

        self.frameWidth = 640
        self.frameHeight = 480
    
    def initial_processing(self,image):
        video = cv2.resize(image,(self.frameWidth, self.frameHeight))
        src_gray = cv2.cvtColor(video, cv2.COLOR_BGR2GRAY)
        blurred = cv2.GaussianBlur(src_gray, (19, 19), 0)
        return blurred

    def apply_ROI(self, image):
	roi = image[int(0.9*self.frameHeight):int(0.99*self.frameHeight),0:self.frameWidth-1]

	return roi

    def get_graph(self,image):

        graph = np.sum(image[int(image.shape[0]/2):,:],axis=0,dtype=np.float32)
        return graph
    
    def find_line(self,graph):
       	pos = np.argmax(graph) - 320
	return pos

class ImageProcessing:
    def __init__(self):
        self.bridge = cv_bridge.CvBridge()

        self.image_sub = rospy.Subscriber('/camera/image_raw',
                Image, self.image_callback) 

        self.image_pub = rospy.Publisher('test_image',
            Image, queue_size=10)
        self.offset_pub = rospy.Publisher('offset',Float32,queue_size=1)
        self.image = None
        rate = rospy.Rate(30)
        self.lane = Lane()
        while not rospy.is_shutdown():
            self.run()
            rate.sleep()

    def image_callback(self, msg):
        self.image = self.bridge.imgmsg_to_cv2(msg,desired_encoding='bgr8')	

    def run(self):
        if self.image is None:
            return

        src_frame = self.image

        proc_frame = self.lane.initial_processing(src_frame)

        roi = self.lane.apply_ROI(proc_frame)

        graph = self.lane.get_graph(roi)

        pos = self.lane.find_line(graph)
	img_back = self.bridge.cv2_to_imgmsg(roi)
	self.image_pub.publish(img_back)
    	self.offset_pub.publish(pos)
            
rospy.init_node('LineDetect')
follower = ImageProcessing()
