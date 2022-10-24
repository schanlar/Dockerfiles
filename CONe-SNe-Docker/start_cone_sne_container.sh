#!/bin/bash

docker run -d --rm \
	--name cone_sne_container -p 6158:22 \
	-v "$PWD/cone_docker_work":/home/docker/docker_work \
	schanlar/cone_sne:latest \
	sleep infinity

docker exec --user root cone_sne_container service ssh start

echo "password is mesa"
ssh -Y -p 6158 docker@localhost

docker kill cone_sne_container
