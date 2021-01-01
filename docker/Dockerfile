FROM ubuntu:18.04
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get autoremove --purge -y \
 && apt-get install -y \
     gawk wget git diffstat unzip texinfo gcc-multilib \
     build-essential chrpath socat cpio python python3 python3-pip python3-pexpect \
     xz-utils debianutils iputils-ping libsdl1.2-dev xterm \
     autoconf libtool libglib2.0-dev libarchive-dev python-git \
     sed cvs subversion coreutils texi2html docbook-utils python-pysqlite2 \
     help2man make gcc g++ desktop-file-utils libgl1-mesa-dev libglu1-mesa-dev \
     mercurial automake groff curl lzop asciidoc u-boot-tools dos2unix mtd-utils pv \
     libncurses5 libncurses5-dev libncursesw5-dev libelf-dev zlib1g-dev bc \
     rsync \
     sudo \
     tmux \
     locales \
 && rm -rf /var/lib/apt/lists/*

# Locales
RUN dpkg-reconfigure locales \
 && locale-gen en_US.UTF-8 \
 && update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
ENV LC_ALL   en_US.UTF-8
ENV LANG     en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

ENV USER yocto
ENV HOME /home/${USER}
ENV SHELL /bin/bash
RUN useradd -m ${USER}
RUN gpasswd -a ${USER} sudo
RUN echo "${USER}:yocto" | chpasswd

ENV REPODIR /usr/bin
ENV REPO    ${REPODIR}/repo

RUN mkdir -p ${REPODIR} \
 && curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ${REPO} \
 && chmod a+x ${REPO}
ENV PATH ${REPODIR}:$PATH

RUN apt-get update && apt-get install -y  bash-completion

######################################################################################
#
######################################################################################
LABEL description=yocto-dart-zeus
LABEL giturl=https://github.com/m-tmatma/yocto-dart.git
LABEL version=1

