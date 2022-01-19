# **Setting up the PuzzleBot Gazebo Simulator for the introductory Workshop** #
- Install ROS Melodic by following [this](http://wiki.ros.org/melodic/Installation/) tutorial. We recommend using Ubuntu 18.04 as Windows support for ROS Melodic is patchy.
- Install the effort controllers package: `sudo apt install ros-melodic-effort-controllers`
- Extract this zip file
- Enter the folder and build the catkin workspace:

	`cd catkin_ws`
	
	`catkin_make`

- Run the simulator: `roslaunch puzzlebot_gazebo puzzlebot_gazebo.launch`
- The simulator listens for velocity commands on `/cmd_vel` and publishes wheel velocities to `/wr` and `/wl`. All other topics are internal and should not be published to by the user.
- In order to run python files with ROS, it is necessary to make them executable:
	`sudo chmod +x <path_to_file>.py`



