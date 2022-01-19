#!/usr/bin/env python3

import rospy, cv2
from sensor_msgs.msg import Image
import numpy as np
from tensorflow.keras.models import load_model
import os, rospkg
from sign_rec.srv import check, data

frameWidth = 640  # CAMERA RESOLUTION
frameHeight = 480
brightness = 180
threshold = 0.75  # PROBABLITY THRESHOLD

class DetectStop():

    # Reformat image using cv2 to simulate a regular camera feed
    def format_image(self,data):
        aux_img = self.imgmsg_to_cv2(data)
        aux_img = cv2.resize(aux_img, (frameWidth, frameHeight))
        return aux_img

    # Change the code form ROS msgs to OpenCV format
    def imgmsg_to_cv2(self,msg):
        return np.frombuffer(msg.data, dtype=np.uint8).reshape(msg.height, msg.width, -1)

    # Apply preprocessing
    def grayscale(self,img):
        img = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
        return img

    def equalize(self,img):
        img = cv2.equalizeHist(img)
        return img

    def preprocessing(self,img):
        img = cv2.resize(img, (32, 32))
        img = self.grayscale(img)
        img = self.equalize(img)
        img = img / 255
        return img.reshape(1, 32, 32, 1)


    def __init__(self):

        # ROS Initialisation
        rospy.init_node("tf_process")
        rate = rospy.Rate(1)

        # Set up project pathing to open model
        rp = rospkg.RosPack()
        script_path = os.path.join(rp.get_path("sign_rec"), "src", "saved_model","my_model")
        # Create ROS services
        get_data = rospy.ServiceProxy('send_data', data)
        check_results = rospy.ServiceProxy('check_results', check)
        # Load the model into the system
        self.model = load_model(script_path)


        while not rospy.is_shutdown():

            # Pick an image from the database and format it
            raw_img = get_data()
            img = self.format_image(raw_img.img)
            img_prerp = self.preprocessing(img)

            # Predit the class of the sample
            predictions = self.model.predict(img_prerp)
            classIndex = np.argmax(predictions,axis=1)

            # Asses if the sample has been correctly classified
            probabilityValue = np.amax(predictions)
            if probabilityValue > threshold:
                print(classIndex)
                ground = check_results(int(classIndex))
                print(ground)
            else:
                print('Not found')

            rate.sleep()

if __name__ == "__main__":
    DetectStop()
