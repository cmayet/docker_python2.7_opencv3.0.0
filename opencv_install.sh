#!/bin/bash

apt-get update
apt-get install -y --no-install-recommends apt-utils
apt-get install -y --no-install-recommends python python-pip \
                                           libpython2.7 \
                                           build-essential \
                                           gfortran \
                                           libatlas-base-dev \
                                           python-dev \
                                           python2.7-dev \
                                           python-tk \
                                           cmake pkg-config \
                                           libjpeg8-dev \
                                           libtiff5-dev \
                                           libjasper-dev \
                                           libpng12-dev \
                                           libavcodec-dev \
                                           libavformat-dev \
                                           libswscale-dev \
                                           libv4l-dev wget \
                                           unzip

pip install --upgrade pip
pip install numpy==1.11.3
mkdir softs 
cd softs 
wget --no-check-certificate https://codeload.github.com/opencv/opencv/zip/3.0.0 
unzip 3.0.0 && rm -rf 3.0.0 
cd opencv-3.0.0 && mkdir build && cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE  .. 
make -j 4 
make install 
rm -rf /softs

apt-get remove --purge -y gfortran build-essential cmake python-pip
rm -rf /var/lib/apt/lists/* /var/cache/apt/archives
