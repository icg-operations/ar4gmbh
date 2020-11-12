FROM buildpack-deps:focal
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
curl 

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - \
&& apt-get install -y nodejs \
libusb-1.0-0-dev \
apt-utils \
bc \
rsync \
ssh \
python-dev \
python \
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

RUN wget -N https://github.com/Kitware/CMake/releases/download/v3.16.0/cmake-3.16.0-Linux-x86_64.tar.gz && tar -xzf cmake-3.16.0-Linux-x86_64.tar.gz -C /usr --strip-components=1 \
&& mkdir tools && cd tools && wget -c https://dl.google.com/android/repository/android-ndk-r16b-linux-x86_64.zip && unzip android-ndk-r16b-linux-x86_64.zip && rm android-ndk-r16b-linux-x86_64.zip \
&& git clone https://github.com/ruslo/polly.git && ln -fs /usr/share/zoneinfo/Europe/Vienna /etc/localtime && dpkg-reconfigure --frontend noninteractive tzdata \
&& apt-get clean && rm -rf /var/lib/apt/lists/* \
