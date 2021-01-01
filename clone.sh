#!/bin/bash -e

SCRIPT_DIR=$(cd $(dirname $0); pwd)

# Top dir of source
HOST_DOCKER_HOME=$SCRIPT_DIR/container/home/yocto
YOCTO_DIR=$HOST_DOCKER_HOME/sources

# 'repo' command
REPO_DIR=$SCRIPT_DIR/bin
REPO=$REPO_DIR/repo

# get 'repo'
mkdir -p $REPO_DIR
curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ${REPO}
chmod a+x ${REPO}
PATH=${REPO_DIR}:$PATH

mkdir -p $YOCTO_DIR
cd $YOCTO_DIR

repo init -u git://github.com/riscv/meta-riscv  -b master -m tools/manifests/riscv-yocto.xml
repo sync
repo start work --all
