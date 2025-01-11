# base image
FROM ubuntu:22.04
ARG DEBIAN_FRONTEND=noninteractive


# docker image arguments
# ARG CPPCHECK_VERSION=2.9

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

# Install verilator dependencies
RUN apt-get install -y help2man perl python3 make autoconf g++ flex bison ccache \
    libgoogle-perftools-dev numactl perl-doc \
    libfl2 libfl-dev zlib1g zlib1g-dev

RUN mkdir setup
WORKDIR /setup

# Install CMAKE
RUN apt update && \
    apt install -y software-properties-common lsb-release && \
    apt clean all
RUN wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | gpg --dearmor - | tee /etc/apt/trusted.gpg.d/kitware.gpg >/dev/null
RUN apt-add-repository "deb https://apt.kitware.com/ubuntu/ $(lsb_release -cs) main"
RUN apt update
RUN apt install -y kitware-archive-keyring
RUN rm /etc/apt/trusted.gpg.d/kitware.gpg
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 6AF7F09730B3F0A4
RUN apt update
RUN apt install -y cmake

COPY verif ./verif
COPY ci ./ci

RUN ./ci/setup.sh

# default startup command
CMD /bin/bash
