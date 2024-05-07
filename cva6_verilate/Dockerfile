# base image
ARG RISCV=/rv_toolchain
FROM ubuntu:20.04
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

COPY verilator-4.110.tar.gz .
RUN tar -xzf verilator-4.110.tar.gz
WORKDIR /verilator-4.110
RUN autoconf
RUN ./configure
RUN make -j `nproc` -j8
RUN make install -j8


# RISCV
WORKDIR /
RUN  mkdir rv_toolchain
COPY riscv64-unknown-elf-gcc-8.3.0-2020.04.0-x86_64-linux-ubuntu14.tar.gz ./rv_toolchain
ARG  RISCV64_UNKNOWN_ELF_GCC=riscv64-unknown-elf-gcc-8.3.0-2020.04.0-x86_64-linux-ubuntu14.tar.gz
WORKDIR /rv_toolchain
RUN  tar -xzf $RISCV64_UNKNOWN_ELF_GCC --strip-components=1

#FESVR
WORKDIR /
RUN  git clone https://github.com/riscv/riscv-isa-sim.git
WORKDIR /riscv-isa-sim
ARG VERSION="35d50bc40e59ea1d5566fbd3d9226023821b1bb6"
RUN git checkout $VERSION
RUN mkdir -p build
WORKDIR /riscv-isa-sim/build
RUN ../configure --prefix="$RISCV/"
RUN make install-config-hdrs install-hdrs libfesvr.a
RUN mkdir -p $RISCV/lib
RUN cp libfesvr.a $RISCV/lib

RUN echo "export RISCV=/rv_toolchain" >> /root/.bashrc
RUN echo "export PATH=$RISCV/bin:/bin:${PATH}" >> /root/.bashrc
RUN echo "export LIBRARY_PATH=$RISCV/lib" >> /root/.bashrc
RUN echo "export LD_LIBRARY_PATH=$RISCV/lib" >> /root/.bashrc
RUN echo "export C_INCLUDE_PATH=$RISCV/include" >> /root/.bashrc
RUN echo "export CPLUS_INCLUDE_PATH=$RISCV/include" >> /root/.bashrc

# default startup command
CMD /bin/bash
