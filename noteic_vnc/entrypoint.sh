#!/bin/bash 

set -e

source /opt/ros/noetic/setup.bash

# [[ "$(lsb_release -sc)" == "focal" ]] || exit 1
# ROS_DISTRO=noetic

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'


# sudo apt-get install -y curl
curl -k https://raw.githubusercontent.com/ros/rosdistro/master/ros.key | sudo apt-key add -

sudo apt-get install -y python3-rosdep



ls /etc/ros/rosdep/sources.list.d/20-default.list > /dev/null 2>&1 && sudo rm /etc/ros/rosdep/sources.list.d/20-default.list
rosdep init 
rosdep update


sudo apt-get install ros-noetic-turtlebot3*



echo "Provided arguments: $@"

exec $@