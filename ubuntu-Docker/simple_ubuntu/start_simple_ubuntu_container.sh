#!/bin/bash

# docker run -d --name simple_ubuntu_container \
#   -v "$PWD/simple_ubuntu_work":/root/docker_work \
#   simple_ubuntu_image
#
# docker exec -it simple_ubuntu_container bash

docker run -it --name simple_ubuntu_container \
  -v "$PWD/simple_ubuntu_work":/root/docker_work \
  ubuntu
