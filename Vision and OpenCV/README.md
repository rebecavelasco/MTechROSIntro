# Vision and OpenCV with ROS #
This section covers how to get started with computer vision and OpenCV using ROS and the PuzzleBot Jetson edition
## Content: ##
- How to obtain images in ROS from the Raspberry Pi Camera
- How to interface OpenCV with ROS
- Example application: Use the camera to detect and follow a white line, and stop if a red object is detected. 
## Workspace ##
The workspace `vision_ws` contains the solution to the task of making the PuzzleBot drive follow a white line, and stop if a red object is detected. It can be used with the included Gazebo simulation, or on the real robot. 

- The image_proc packaged contains two nodes:
	- `lane_detect.py` to track the white line
	- `colour_detect.py` to detect colour. 
- The controller packaged contains one node that listens for signals from the other two nodes and outputs to the wheels as required


The simulator requires the ROS control and ROS controllers packages, and OpenCV. Once these are installed, build the workspace with `catkin_make` and run the launch file `controller_simulation.launch` inside the controller package. 

`sudo apt install ros-melodic-ros-control ros-melodic-ros-controllers`

`sudo apt install python-pip`

`pip install python-opencv`


To run on the real robot, copy the controller and image_proc package into `~/catkin_ws/src` in the Jetson's file system. Then, build the workspace with `catkin_make` and run the launch file `controller_real_robot.launch` inside the controller package. 

If the robot does not move, always check the motor isolator switch. Then, check the communication with the Jetson is working with `rostopic list`. If `/cmd_vel`, `/wr`, or `/wl` are not present, the communication is not working. Restart the communication by running `sudo systemctl restart puzzlebot.service` on the Jetson, or reboot the Jetson and the Hacker Board

