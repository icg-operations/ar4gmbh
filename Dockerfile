FROM buildpack-deps:bionic
MAINTAINER AR4 GmbH <office@ar4.io>

ENV TERM=xterm
ENV ANDROID_NDK /tools/android-ndk-r16b
ENV ANDROID_NDK_r16b=/tools/android-ndk-r16b
ENV POLLY_ROOT /tools/polly
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
apt-utils \
unzip \
git \
curl \
apt-utils \
bc \
rsync \
ssh \
python-dev \
python \
python-pip \
curl \
autoconf \
automake \
libstdc++6 \
libc6 \
libtool \
make \
g++ \
gcc \
wget \
build-essential \
npm \
nodejs \
node-gyp \
nodejs-dev \
libssl1.0-dev \
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
mono-xbuild \
&& apt-get clean && rm -rf /var/lib/apt/lists/* \
&& wget -N https://github.com/Kitware/CMake/releases/download/v3.16.0/cmake-3.16.0-Linux-x86_64.tar.gz && tar -xzf cmake-3.16.0-Linux-x86_64.tar.gz -C /usr --strip-components=1 \
&& mkdir tools && cd tools && wget -c https://dl.google.com/android/repository/android-ndk-r16b-linux-x86_64.zip && unzip android-ndk-r16b-linux-x86_64.zip && rm android-ndk-r16b-linux-x86_64.zip \
&& git clone https://github.com/ruslo/polly.git && ln -fs /usr/share/zoneinfo/Europe/Vienna /etc/localtime && dpkg-reconfigure --frontend noninteractive tzdata
