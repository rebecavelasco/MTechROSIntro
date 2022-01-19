# AI in ROS # 
This section covers all the basics to handle AI implementation in ROS 

# Content #

- How to train a neural network
- How to embed it in a ROS node

# ROS Workspaces and code #
- `AI_activity` ROS workspace with the implementation of the network. 
  - `data`: AI model used to classify samples
  - `saved_model`: Images to be classified
  - `detect_sign.py` : code to classify the samples 
  - `get_samples.py` : code to retrieve the samples 
- `Train.ipynb` :Jupyter notebook used to train the network

## AI_activity Instructions ##

In order to start the activity do the following steps

1) Compile the project
2) rosrun get_samples.py
3) rosrun detect_sign.py

# Usefull Sources #
- Dataset: https://benchmark.ini.rub.de
- Nvidia deep learning with Nano: https://github.com/dusty-nv/ros_deep_learning
