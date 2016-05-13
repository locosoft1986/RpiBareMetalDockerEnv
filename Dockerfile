FROM debian:jessie

# Packaged dependencies
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
	apparmor \
	aufs-tools \
	automake \
	bash-completion \
	btrfs-tools \
	build-essential \
	createrepo \
	curl \
	dpkg-sig \
	git \
	iptables \
	jq \
	net-tools \
	libapparmor-dev \
	libcap-dev \
	libltdl-dev \
	libsqlite3-dev \
	libsystemd-journal-dev \
	libtool \
	mercurial \
	pkg-config \
	xfsprogs \
	tar \
    libguestfs-tools \
    libncurses5-dev \
    tree \
    binfmt-support \
    qemu \
    qemu-user-static \
    debootstrap \
    kpartx \
    lvm2 \
    dosfstools \
    zip \
    unzip \
    vim \
    awscli \
    shellcheck \
    screen \
	--no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

RUN dpkg --add-architecture i386 && \ 
	apt-get update &&\
	apt-get install libc6:i386 -y 

RUN mkdir -p /usr/local/tmp && \ 
	wget -qO- "https://cmake.org/files/v3.5/cmake-3.5.2-Linux-x86_64.tar.gz" \
		| tar -xzC /usr/local/tmp

RUN wget -qO- "https://launchpad.net/gcc-arm-embedded/5.0/5-2016-q1-update/+download/gcc-arm-none-eabi-5_3-2016q1-20160330-linux.tar.bz2" \
		| tar -xjC /usr/local/tmp


RUN mkdir -p /usr/local/env && \
	cp -Rf /usr/local/tmp/gcc-arm-none-eabi-5_3-2016q1 /usr/local/env/gcc-arm-none-eabi && \
	cp -Rf /usr/local/tmp/cmake-3.5.2-Linux-x86_64 /usr/local/env/cmake

ENV PATH /usr/local/env/gcc-arm-none-eabi/bin:/usr/local/env/cmake/bin:$PATH

RUN rm -Rf /usr/local/tmp

WORKDIR /projects/workspace

# If you want to use Raspberry Pi C++ toolchains, delete '#' of the following two lines.

# RUN git clone https://github.com/raspberrypi/tools.git /usr/local/env/tools
# ENV PATH /usr/local/env/tools/arm-bcm2708/arm-rpi-4.9.3-linux-gnueabihf:$PATH
 