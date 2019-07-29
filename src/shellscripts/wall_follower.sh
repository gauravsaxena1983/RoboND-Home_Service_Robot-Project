#!/bin/bash

# Build the catkin_ws
cd $(pwd)/../..; catkin_make

# Launch the nodes
xterm  -e "source devel/setup.bash; export TURTLEBOT_GAZEBO_WORLD_FILE="$(pwd)/src/world/home_world.world"; roslaunch turtlebot_gazebo turtlebot_world.launch" &
sleep 10
xterm  -e "source devel/setup.bash; roslaunch turtlebot_gazebo gmapping_demo.launch custom_gmapping_launch_file:="$(pwd)/src/slam_gmapping/gmapping/launch/slam_gmapping_pr2.launch"  " &
sleep 5
xterm  -e "source devel/setup.bash; roslaunch turtlebot_rviz_launchers view_navigation.launch" &
sleep 5
xterm  -e "source devel/setup.bash; rosrun wall_follower wall_follower"