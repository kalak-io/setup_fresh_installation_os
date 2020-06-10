FROM ubuntu:20.04

RUN apt update && \
      apt install -y sudo

RUN useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo

USER docker

ADD setup.sh /setup.sh
RUN /setup.sh