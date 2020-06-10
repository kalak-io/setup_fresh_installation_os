FROM ubuntu:20.04

RUN apt-get update
RUN apt-get install -y wget sudo
RUN useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo

CMD ["/bin/bash"]

USER docker