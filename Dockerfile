FROM nvidia/opengl:1.2-glvnd-runtime-ubuntu20.04

# configs
ARG user=docker
ARG passwd=docker
ARG ros_type=desktop-full
ARG home=/home/$user

# install basic softwares and add user
# prevent interactive input prompts
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && \
    apt install -y xauth zsh git curl glmark2 lsb-release gnupg2 && \
    useradd --create-home -s /bin/bash $user && \
    echo $user:$passwd | chpasswd && \
    adduser $user sudo

# install ros and clean cache
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list' && \
    curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add - && \
    apt update && \
    apt install -y ros-noetic-$ros_type && \
    rm -rf /var/lib/apt/lists/* && \
    echo "source /opt/ros/noetic/setup.bash" >> $home/.bashrc
