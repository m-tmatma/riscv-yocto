#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)

cd $SCRIPT_DIR/sources
source ./meta-riscv/setup.sh

#mkdir -p $SCRIPT_DIR/downloads
#ln -sf   $SCRIPT_DIR/downloads

MACHINE=qemuriscv64 bitbake core-image-full-cmdline
