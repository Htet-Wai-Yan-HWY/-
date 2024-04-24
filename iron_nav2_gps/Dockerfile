FROM osrf/ros:iron-desktop

WORKDIR /home/nav2_gps_ws

RUN . /opt/ros/iron/setup.sh \
    && apt-get update \
    && apt-get install -y python3-pip \
    ros-iron-demo-nodes-cpp \
    ros-iron-robot-localization \
    ros-iron-mapviz \
    ros-iron-mapviz-plugins \
    ros-iron-tile-map \
    ros-iron-navigation2 \
    ros-iron-nav2-bringup \
    ros-iron-turtlebot3-gazebo \
    &&  apt autoremove -y \
    &&  rm -rf /var/lib/apt/lists/*


RUN apt-get update \
 && apt-get install -y \
    wget \
    lsb-release \
    sudo \
    mesa-utils \
 && apt-get clean


RUN git clone https://github.com/ros-planning/navigation2_tutorials.git src/navigation2_tutorials \
    && . /opt/ros/iron/setup.sh \
    && apt-get update \
    && rosdep update \
    && rosdep install --from-paths src --ignore-src -y \
    && colcon build \
    && rm -rf log/ build/ src/* \
    && rm -rf /var/lib/apt/lists/*

COPY ros_entrypoint.sh /
ENTRYPOINT [ "/ros_entrypoint.sh" ]

CMD ["bash"]