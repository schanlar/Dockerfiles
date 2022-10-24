#!/bin/bash

docker run -d --rm \
			--name tempo2 \
			-p 2222:22 \
			-v "$PWD/tempo2_work":/data \
			schanlar/psr_soft

docker exec --user root tempo2 service ssh start

echo "password is psr"
ssh -XY psr@localhost -p 2222

docker stop tempo2
