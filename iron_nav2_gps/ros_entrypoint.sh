#!/bin/bash
 
# Source ROS and Catkin workspaces
source /opt/ros/iron/setup.bash
if [ -f /home/nav2_gps_ws/install/setup.bash ]
then
  source /home/nav2_gps_ws/install/setup.bash
  echo "Sourced nav2_gps workspace!"
fi
 
# Set environment variables
export TURTLEBOT3_MODEL=waffle
export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:/opt/ros/iron/share/turtlebot3_gazebo/models

# Execute the command passed into this entrypoint
exec "$@"