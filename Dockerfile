FROM buildpack-deps:xenial
MAINTAINER AR4 GmbH <office@ar4.io>

ENV TERM=xterm
ENV ANDROID_NDK /tools/android-ndk-r11c
ENV ANDROID_NDK_r11c=/tools/android-ndk-r11c
ENV POLLY_ROOT /tools/polly

RUN apt-get update && apt-get install -y \
apt-utils \
unzip \
git \
curl \
apt-utils \
bc \
rsync \
ssh \
libpq-dev \
libmysqlclient-dev \
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
node.js \
golang \
mesa-common-dev \
libgl1-mesa-dev \
libgtk2.0-dev \
libgstreamer-plugins-base0.10-dev \
libxml2-dev \
libxslt1-dev \
zip \
nano \
nasm \
wget \
&& apt-get clean && rm -rf /var/lib/apt/lists/* \ 
&& wget -N https://cmake.org/files/v3.10/cmake-3.10.0-Linux-x86_64.tar.gz && tar -xzf cmake-3.10.0-Linux-x86_64.tar.gz -C /usr --strip-components=1 \
&& mkdir tools && cd tools && wget -c https://dl.google.com/android/repository/android-ndk-r11c-linux-x86_64.zip && unzip android-ndk-r11c-linux-x86_64.zip && rm android-ndk-r11c-linux-x86_64.zip \
&& git clone https://github.com/ruslo/polly
