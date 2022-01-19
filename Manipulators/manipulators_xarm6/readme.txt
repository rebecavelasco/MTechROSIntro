Steps to launch the simulation (follow this order and source the project in all terminals): 

Terminal 1: 
	 Launch simulation (Gazebo) Empty worlds with other manipulators can be found f.e xarm5_beside_table.launch 
	 launches a table and an empty gazebo world. Some erros may pop up but shouldn't afect the simulation. 

	 roslaunch xarm_gazebo xarm_world.launch 


Terminal 2: 
	 Launch moveit (RViz) change name to match your manipulator

	 roslaunch xarm7_vacuum_gripper_moveit_config xarm6_vacuum_gripper_moveit_gazebo.launch 

Terminal 3: 
	 run the piece of code that takes the information from Gazebo and sends goals to the planner

	 rosrun path_planner GoalPlanner.py

Terminal 4: 
	 run the piece of code that takes the information from Gazebo and sends goals to the planner

	 rosrun pick_place solution.py

