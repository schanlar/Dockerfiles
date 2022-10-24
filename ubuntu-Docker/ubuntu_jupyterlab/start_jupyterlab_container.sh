#!/bin/bash

docker run -d --rm --name jupyterlab_container -p 8888:8888 \
  -v "$PWD/ubuntu_jupyterlab_work":/root/docker_work \
  ubuntu_jupyterlab_image

docker exec -it jupyterlab_container bash
docker kill jupyterlab_container
