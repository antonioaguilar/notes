#!/bin/bash

apt update
apt install -y \
tree htop ncdu git wget curl pkg-config bat \
make cmake gcc g++ ccache nasm build-essential doxygen gdb valgrind \
libjpeg-dev libtiff-dev libopenjp2-7 libopenjp2-tools \
libnats-dev libssl-dev libpthread-stubs0-dev \
libomp-dev libopenblas-dev libopenblas-openmp-dev libatlas-base-dev liblapack-dev ocl-icd-opencl-dev \
python3 python3-pip python3-pipdeptree python3-opencv python3-pygments python3-bs4 \
ffmpeg libavutil-dev libavcodec-dev libavformat-dev libavdevice-dev libavfilter-dev libswscale-dev libswresample-dev libpostproc-dev \
libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libgstreamer-plugins-bad1.0-dev gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-tools gstreamer1.0-x gstreamer1.0-alsa gstreamer1.0-gl gstreamer1.0-gtk3 gstreamer1.0-qt5 gstreamer1.0-pulseaudio gstreamer1.0-opencv gstreamer1.0-rtsp
