FROM ubuntu:22.04

SHELL ["/bin/bash", "-c"]

RUN apt-get update -y \
	&& apt-get install -y git \
	&& apt-get install -y vim \
	&& apt-get install -y unzip \
	&& apt-get install -y wget \
	&& apt-get install -y python3 python3-pip \
	&& pip3 install --upgrade pip \
	&& pip3 install -U matplotlib \
	&& pip3 install -U pandas \
	&& pip3 install -U numpy

RUN apt-get install -y binutils \
	&& apt-get install -y make \
	&& apt-get install -y perl \
	&& apt-get install -y libx11-6 \
	&& apt-get install -y libx11-dev \
	&& apt-get install -y zlib1g \
	&& apt-get install -y zlib1g-dev \
	&& apt-get install -y tcsh

WORKDIR /home/docker

# Install py_mesa_reader
RUN git clone https://github.com/wmwolf/py_mesa_reader.git
WORKDIR /home/docker/py_mesa_reader
RUN pip install .

# Install MESA SDK
WORKDIR /home/docker
ADD http://www.astro.wisc.edu/~townsend/resource/download/mesasdk/old/mesasdk-x86_64-linux-20180822.tar.gz /home/docker

RUN tar xvfz mesasdk-x86_64-linux-20180822.tar.gz && rm -rf mesasdk-x86_64-linux-20180822.tar.gz

ENV MESASDK_ROOT=/home/docker/mesasdk
RUN echo 'source $MESASDK_ROOT/bin/mesasdk_init.sh' >> /root/.bashrc


# Install MESA
RUN wget https://sourceforge.net/projects/mesa/files/releases/mesa-r10398.zip \
	&& unzip mesa-r10398.zip \
	&& rm -rf mesa-r10398.zip

ENV MESA_DIR=/home/docker/mesa-r10398
ENV OMP_NUM_THREADS=2

WORKDIR /home/docker/mesa-r10398/utils
RUN tar -zxvf ndiff-2.00.tar.gz
WORKDIR /home/docker/mesa-r10398/utils/ndiff-2.00
RUN ./configure && make all && make install

WORKDIR /home/docker/mesa-r10398/utils
RUN tar -zxvf makedepf90-2.8.8.tar.gz
WORKDIR /home/docker/mesa-r10398/utils/makedepf90-2.8.8
RUN ./configure && make install

WORKDIR /home/docker/mesa-r10398
#CMD source $MESASDK_ROOT/bin/mesasdk_init.sh
RUN ./install




# RUN useradd -ms /bin/bash user
# RUN echo user:mesa | chpasswd



# COPY mesasdk-x86_64-linux-20180822.tar.gz mesasdk.tar.gz
# COPY mesa-r10398.zip mesa.zip
#
# RUN tar xvfz mesasdk.tar.gz && rm -rf mesasdk.tar.gz
#
# ENV MESASDK_ROOT=/home/user/mesasdk
# RUN echo 'MESASDK_ROOT=/home/user/mesasdk' >> /home/user/.bashrc \
# 	&& echo 'source $MESASDK_ROOT/bin/mesasdk_init.sh' >> /home/user/.bashrc
#
#
# RUN unzip mesa.zip && rm -rf mesa.zip
# ENV MESA_DIR=/home/user/mesa-r10398
# ENV OMP_NUM_THREADS=2
#
# RUN echo 'MESA_DIR=/home/user/mesa-r10398' >> /home/user/.bashrc \
# 	&& echo 'OMP_NUM_THREADS=2' >> /home/user/.bashrc
#
#
# # WORKDIR /home/user/mesa-r10398/utils
# # RUN tar -zxvf ndiff-2.00.tar.gz
# # WORKDIR /home/user/mesa-r10398/utils/ndiff-2.00
# # RUN ./configure && make all && make install
#
# # WORKDIR /home/user/mesa-r10398/utils
# # RUN tar -zxvf makedepf90-2.8.8.tar.gz
# # WORKDIR /home/user/mesa-r10398/utils/makedepf90-2.8.8
# # RUN ./configure && make install
#
# WORKDIR /home/user/mesa-r10398
# RUN ./install
#
#
# USER user
# WORKDIR /home/user
