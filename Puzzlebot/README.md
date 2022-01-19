# Puzzlebot Introduction #
This section covers how to get started with ROS on the PuzzleBot Jetson Edition
## Content: ##
- Hacker Board Hardware and Firmware
- Jetson Nano Hardware, Firmware and Software
- How to configure the Hacker Board for use with the Jetson
- How to setup the Jetson Nano
- How to teleoperate the PuzzleBot using ROS and python
- How to write a basic control scheme on the PuzzleBot using ROS
## Workspace ##
The workspace `puzzlebot_ws` contains the solution to the task of making the PuzzleBot drive in a square. It can be used with the included Gazebo simulation, or on the real robot. 

The simulator requires the ROS control and ROS controllers packages. Once these are installed, build the workspace with `catkin_make` and run the launch file `controller_simulation.launch` inside the controller package. 

`sudo apt install ros-melodic-ros-control ros-melodic-ros-controllers`


To run on the real robot, copy the controller package into `~/catkin_ws/src` in the Jetson's file system. Then, run the launch file `controller_real_robot.launch` inside the controller package.

If the robot does not move, always check the motor isolator switch. Then, check the communication with the Jetson is working with `rostopic list`. If `/cmd_vel`, `/wr`, or `/wl` are not present, the communication is not working. Restart the communication by running `sudo systemctl restart puzzlebot.service` on the Jetson, or reboot the Jetson and the Hacker Board

