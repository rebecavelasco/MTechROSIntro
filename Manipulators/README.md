
# Manipulators #
This section covers all required knowledge to control xarm manipualtors with MoveIt! 
## ROS Workspaces ##
The workspace 'manipulators_xarm' containt the solution to the pick and place activity using both arms. In order to change robot models you have to follow these steps
- Adjust Gazebo simulation to avoid collisions in the initial pose
- Check that all frames are aligned proplery and publish static transforms to solve that if necessary (example in launchfile)
- Change planning groups in solution.py to match moveit definitions that can be seen in RViz


- `pick_place` ROS package with the solution of the activity. 
  - `solution6.py`: Solution to the activity with xarm6
  - `solution7.py`: Solution to the activity with xarm7
  - `solution_blank`: Proposed activity template
- `path_planner`: ROS package with a dummy task planner.
  - `GoalPlanner.py`: Code to execute path planner. Tunning is adviced when chaning manipulator to improve visuals

## Manipulator activity Instructions ##

Steps to launch the simulation (follow this order and source the project in all terminals) replace X by either 6 or 7
- Terminal 1:
  - Launch simulation (Gazebo) Empty worlds with other manipulators can be found f.e `xarm5_beside_table.launch` launches a table and an empty gazebo world. Some erros may pop up but shouldn't afect the simulation. 
  
    `roslaunch xarm_gazebo xarmX_world.launch`

- Terminal 2: 
   - Launch moveit (RViz) change name to match your manipulator

     `roslaunch xarmX_vacuum_gripper_moveit_config xarmX_vacuum_gripper_moveit_gazebo.launch`

- Terminal 3: 
     - Run the piece of code that takes the information from Gazebo and sends goals to the planner
        
       `rosrun path_planner GoalPlanner.py`

- Terminal 4: 
     - Run the piece of code that takes the information from Gazebo and sends goals to the planner

       `rosrun pick_place solutionX.py`

## Sugestions to improve the simulation ##

- If force control is required Set the force control flag in xarmX_world to true and test how well does the system respond. In the folder /xarm/gazebo_ros_control PID parameters should be available to tune the system properly. 

- If gripper simulation is required it is possible to use third party plugins to simulate it properly, their documentation can be found in xarm webpage. If it is not necesary we recomend to improve the dummy function that attaches the box to the End effector by tunning the distance between the box and the end effector (should be as close as possible but without colisions). 

- Usage of the real robot is suported and should be documented by xarm in their webpage. 

- If more planner parameters need to be set up it is recomended to use MoveIt in Cpp, the documentation can be found in their webpage.

- Potential improvements to the MoveIt obstacle detection could be done by adding some scene managment code, as now the boxes stack on the target and are considered obstacles, we suggest to remove the box from the scene once the pick and place operations ends.

Links to aditional documentation can be found in the power point 







