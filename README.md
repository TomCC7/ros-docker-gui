# ros-docker-gui

[ROS](https://www.ros.org/) docker image with GUI and Nvidia GPU acceleration support. There's a more comprehensive repo [here](https://github.com/turlucode/ros-docker-gui).

## How to use

+ clone this repository and build

  ```bash
  docker build -t ros-docker-gui .
  ```

+ run the container

  ```bash
  docker run -it \
         -e DISPLAY \
         --gpus all \
         -v /tmp/.X11-unix/:/tmp/.X11-unix/  \
         --network host \
         --name ros-gui \
         ros-docker-gui
  ```

+ configure `xauth`

  + on host machine, copy token listed by

  ```bash
  xauth list
  ```

  + in docker, add the token

  ```bash
  xauth add <token>
  ```

+ tests

  ```bash
  # gpu
  nvidia-smi
  # GUI application
  glmark2
  # gazebo
  gazebo
  ```

+ initialize `rosdep`

```bash
sudo rosdep init
rosdep update
```

