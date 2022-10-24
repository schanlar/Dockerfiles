FROM ubuntu:latest

RUN apt-get update -y
RUN apt-get install -y python3 python3-pip
RUN pip3 install --upgrade pip
RUN pip3 install -U matplotlib
RUN pip3 install -U pandas
RUN pip3 install -U numpy

WORKDIR /root/docker_work
