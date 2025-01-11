#!/bin/bash
set -e

if [ ! -e "${RISCV}/bin/spike"  ]; then
    echo "Installing fesvr"
    cd $FESVR_SRC_DIR/build
    ../configure --prefix="$RISCV/"
    make install-config-hdrs install-hdrs libfesvr.a
    mkdir -p $RISCV/lib
    cp libfesvr.a $RISCV/lib
else
    echo "Using fesvr from cached directory."
fi
