FROM ubuntu:15.04
MAINTAINER Leon Lei <leonlei1983@gmail.com>

# Define working directory.
WORKDIR /root

# Set environment variables.
ENV HOME /root

# Install.
ADD .vim /root/.vim
ADD .screenrc /root/.screenrc

RUN apt-get update && \
	apt-get install -y curl git vim wget screen python2.7 openjdk-7-jdk && \
	rm -rf /var/lib/apt/lists/*

RUN ln -s python2.7 /usr/bin/python && \
	mv /root/.vim/vimrc /root/.vimrc && \
	git clone https://git.gitorious.org/gitorious/ce-installer.git && cd ce-installer && ./install

# Define default command.
CMD ["/usr/sbin/sshd", "-D"]

# Expose ports.
# EXPOSE 5901

ENTRYPOINT ["/bin/bash"]
