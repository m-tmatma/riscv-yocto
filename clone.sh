#!/bin/bash -e

SCRIPT_DIR=$(cd $(dirname $0); pwd)

# Top dir of source
HOST_DOCKER_HOME=$SCRIPT_DIR/container/home/yocto
YOCTO_DIR=$HOST_DOCKER_HOME/sources

mkdir -p $YOCTO_DIR
cd $YOCTO_DIR

repo init -u https://github.com/riscv/meta-riscv  -b master -m tools/manifests/riscv-yocto.xml
repo sync
repo start work --all
