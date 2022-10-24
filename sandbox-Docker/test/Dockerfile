FROM ubuntu:22.04
MAINTAINER Savvas Chanlaridis

SHELL ["/bin/bash", "-c"]
#EXPOSE 8888


COPY apt_packages.txt /tmp/apt_packages.txt

RUN apt-get update && \
    apt-get -y install $(cat /tmp/apt_packages.txt) && \
    apt-get autoremove --yes && apt-get clean all && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pip3 install --upgrade pip \
	&& pip3 install -U matplotlib \
	&& pip3 install -U pandas \
	&& pip3 install -U numpy
  #&& pip3 install jupyterlab


RUN useradd -d /home/user -m -c "" user && \
    chown -R user:user /home/user && \
    chmod -R 775 /home/user/

USER user
COPY dotfile /home/user/.bash_aliases


# RUN (cd /tmp; wget --user-agent=""  http://www.astro.wisc.edu/~townsend/resource/download/mesasdk/old/mesasdk-x86_64-linux-20180822.tar.gz) && \
#     tar xvfz /tmp/mesasdk-x86_64-linux-20180822.tar.gz -C /home/user && \
#     rm -f /tmp/mesasdk-x86_64-linux-20180822.tar.gz

COPY mesasdk-x86_64-linux-20180822.tar.gz /tmp/mesasdk-x86_64-linux-20180822.tar.gz
RUN (cd /tmp;) &&  \
    tar xvfz /tmp/mesasdk-x86_64-linux-20180822.tar.gz -C /home/user
    #&& rm -f /tmp/mesasdk-x86_64-linux-20180822.tar.gz


COPY mesa-r10398.zip /tmp/mesa-r10398.zip
RUN (cd /tmp;) && \
    unzip /tmp/mesa-r10398.zip -d /home/user
  #&&  rm -f /tmp/mesa-r10398.zip

# RUN (cd /tmp; wget --user-agent=""  https://sourceforge.net/projects/mesa/files/releases/mesa-r10398.zip) && \
#     unzip /tmp/mesa-r10398.zip -d /home/user && \
#     rm -f /tmp/mesa-r10398.zip




RUN cd /home/user/mesa-r10398 \
  && ./install

USER user
ENV HOME /home/user
WORKDIR /home/user
#CMD jupyter-lab --ip=0.0.0.0 --allow-root --NotebookApp.token=''
