FROM ubuntu
MAINTAINER Leon Lei <leonlei1983@gmail.com>

ENV HOME /root
WORKDIR $HOME

# Install.
ADD bashfiles/* /root/

RUN apt-get update && \
	apt-get install -y curl git ssh vim wget screen python2.7 openjdk-7-jdk \
	openssh-server zip unzip net-tools make ruby && \
	apt-get autoclean && \
	apt-get autoremove && \
	rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/sshd && \
	echo 'root:root1234' | chpasswd && \
	echo "GIT_PS1_SHOWUPSTREAM='auto'" >> /root/.bashrc && \
	echo "PS1='\u@\h [\033[1;31m$(__git_ps1 \" %s\")\033[0m \033[1;33m$PWD\033[0m ]\n$ '"  >> /root/.bashrc && \
	echo "[ -f ~/.git-prompt.sh ] && . ~/.git-prompt.sh"  >> /root/.bashrc && \
	sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
	sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

# EXPOSE 22
# CMD ["/usr/sbin/sshd", "-D"]

# Expose ports.
# EXPOSE 5901

# ENTRYPOINT ["/bin/bash"]
