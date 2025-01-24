#!/bin/bash

export RISCV=/setup/tools/riscv-toolchain/
export VERILATOR_ROOT=/setup/tools/verilator/build-v5.008/
export PATH=$VERILATOR_ROOT/bin/:$PATH
export NUM_JOBS=12
cp -r /setup/tools/verilator/share /
