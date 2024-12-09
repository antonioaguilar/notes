#!/bin/bash

apt update
apt install -y \
tree htop ncdu git wget curl pkg-config bat \
make cmake gcc g++ ccache nasm build-essential doxygen gdb valgrind autoconf automake libtool flex bison \
libncurses-dev libjpeg-dev libtiff-dev libopenjp2-7 libopenjp2-tools libbz2-dev \
libnats-dev libssl-dev libpthread-stubs0-dev \
libomp-dev libopenblas-dev libopenblas-openmp-dev libatlas-base-dev liblapack-dev ocl-icd-opencl-dev \
binwalk forensics-all \
python3 python3-pip python3-pipdeptree python3-opencv python3-venv python3-pygments python3-bs4 python3-dev libcairo2-dev \
ffmpeg libavutil-dev libavcodec-dev libavformat-dev libavdevice-dev libavfilter-dev libswscale-dev libswresample-dev libpostproc-dev \
libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libgstreamer-plugins-bad1.0-dev gstreamer1.0-plugins-base gstreamer1.0-plugins-base-apps gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-bad-apps gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-tools gstreamer1.0-x gstreamer1.0-alsa gstreamer1.0-gl gstreamer1.0-gtk3 gstreamer1.0-qt5 gstreamer1.0-pulseaudio gstreamer1.0-opencv gstreamer1.0-rtsp gstreamer1.0-python3-plugin-loader python3-gst-1.0 python3-gi python3.10-venv libcairo2-dev libxt-dev libgirepository1.0-dev libpython3.10-dev python-gi-dev
