FROM ubuntu:15.04
MAINTAINER Leon Lei <leonlei1983@gmail.com>

# Install.
RUN apt-get update
RUN apt-get -y install -y curl git vim wget screen
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y lxde-core lxterminal tightvncserver
RUN rm -rf /var/lib/apt/lists/*

ADD .vim /root/.vim
ADD .screenrc /root/.screenrc

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["bash"]

# Expose ports.
EXPOSE 5901
