FROM buildpack-deps:noble
MAINTAINER AR4 GmbH <office@ar4.io>

ENV TERM=xterm
ENV ANDROID_NDK /tools/android-ndk-r23c
ENV ANDROID_NDK_r23c=/tools/android-ndk-r23c
ENV POLLY_ROOT /tools/polly
ENV DEBIAN_FRONTEND=noninteractive

RUN sed -i -e 's/^APT/# APT/' -e 's/^DPkg/# DPkg/' \
      /etc/apt/apt.conf.d/docker-clean

RUN apt update && apt install -y \
apt-utils \
unzip \
git \
curl

RUN curl -sL https://deb.nodesource.com/setup_18.x | bash - \
&& apt install -y nodejs \
libusb-1.0-0-dev \
bc \
rsync \
ssh \
python-dev-is-python3 \
python-is-python3 \
curl \
autoconf \
automake \
libstdc++6 \
libc6 \
libtool \
pkg-config \
xz-utils \
make \
g++ \
gcc \
ffmpeg libswresample-dev libavcodec-dev libavutil-dev libavformat-dev libswscale-dev \
wget \
build-essential \
libssl-dev \
openssh-client \
golang \
mesa-common-dev \
libgl1-mesa-dev \
libgtk2.0-dev \
libxml2-dev \
libxslt1-dev \
zip \
nano \
nasm \
vim \
wget \
freeglut3-dev \
mono-xbuild

RUN wget -N https://github.com/Kitware/CMake/releases/download/v3.24.2/cmake-3.24.2-linux-x86_64.tar.gz && tar -xzf cmake-3.24.2-linux-x86_64.tar.gz -C /usr --strip-components=1 \
&& mkdir tools && cd tools && wget -c https://dl.google.com/android/repository/android-ndk-r23c-linux.zip && unzip android-ndk-r23c-linux.zip && rm android-ndk-r23c-linux.zip \
&& git clone https://github.com/belveder79/polly.git && ln -fs /usr/share/zoneinfo/Europe/Vienna /etc/localtime && dpkg-reconfigure --frontend noninteractive tzdata \
&& apt clean && apt-get -y autoclean \
&& apt-get -y autoremove && rm -rf /var/lib/apt/lists/*
