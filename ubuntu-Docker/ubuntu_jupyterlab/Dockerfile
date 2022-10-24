FROM ubuntu:latest
EXPOSE 8888

RUN apt-get update -y
RUN apt-get install -y python3 python3-pip
RUN pip3 install --upgrade pip
RUN pip3 install jupyterlab
RUN pip3 install -U matplotlib
RUN pip3 install -U pandas
RUN pip3 install -U tensorflow
RUN pip3 install -U scikit-learn
RUN pip3 install -U numpy

WORKDIR /root/docker_work
CMD jupyter-lab --ip=0.0.0.0 --allow-root --NotebookApp.token=''
