# base image
FROM ubuntu:22.04
ARG DEBIAN_FRONTEND=noninteractive

# Install base dependencies
RUN apt-get update && apt-get install -y \
        git \
        curl \
        wget \
        xz-utils \
        apt-utils \
        build-essential \
        gcc-multilib \
        python3 \
        python3-pip \
        enchant-2 \
        software-properties-common \
        ninja-build \
        pkg-config \
        libglib2.0-dev \
        libpixman-1-dev \
        libslirp-dev \
        bison \
        flex \
        tree \
        vim \
        nano \
        device-tree-compiler

# Qemu dependecies
RUN apt-get update && apt-get install -y \
        libglib2.0-dev \
        libfdt-dev \
        libpixman-1-dev \
        zlib1g-dev \
        ninja-build \
        git-email \
        libaio-dev \
        libbluetooth-dev \
        libcapstone-dev \
        libbrlapi-dev \
        libbz2-dev \
        libcap-ng-dev \
        libcurl4-gnutls-dev \
        libgtk-3-dev \
        libibverbs-dev \
        libjpeg8-dev \
        libncurses5-dev \
        libnuma-dev \
        librbd-dev \
        librdmacm-dev \
        libsasl2-dev \
        libsdl2-dev \
        libseccomp-dev \
        libsnappy-dev \
        libssh-dev \
        libvde-dev \
        libvdeplug-dev \
        libvte-2.91-dev \
        libxen-dev \
        liblzo2-dev \
        valgrind \
        xfslibs-dev \
        python3-sphinx

RUN pip3 install \
        tomli

# default startup command
CMD /bin/bash
