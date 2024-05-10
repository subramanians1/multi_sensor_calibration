# FROM ubuntu:bionic
FROM ros:melodic-ros-core-bionic

RUN apt-get update
RUN apt-get install -y lsb-release

# Install ROS dependencies
RUN apt-get install -y ros-melodic-desktop-full
RUN apt-get install -y ros-melodic-pcl-ros
#RUN apt-get install ros-melodic-opencv3
RUN apt-get install -y ros-melodic-ros-numpy
RUN apt-get install -y ros-melodic-astuff-sensor-msgs

# Install necessary packages
RUN apt-get install libeigen3-dev
RUN apt-get install python-rospkg
RUN apt-get install -y build-essential
RUN apt-get install python3-dev
RUN apt-get install -y python3-setuptools
RUN apt-get install -y libatlas-base-dev
RUN apt-get install libatlas3-base
RUN apt-get install python3-numpy
RUN apt-get install -y python3-scipy
RUN apt-get install -y python3-pip
RUN apt-get install -y python3-matplotlib
RUN apt-get install python3-yaml
RUN apt-get install -y python3-sklearn
RUN apt-get install -y git-all
RUN pip3 install rmsd
RUN pip3 install rospkg
RUN pip3 install tikzplotlib

WORKDIR /calibration_ws

COPY . ./src

RUN . /opt/ros/melodic/setup.sh && catkin_make

EXPOSE 4000

CMD {"source", "devel/setup.bash"}




