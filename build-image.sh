#!/bin/bash -e
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
source ${SCRIPT_DIR}/common-variable.sh

docker build -t $DOCKERIMAGE $SCRIPT_DIR/docker