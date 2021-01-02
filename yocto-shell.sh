#!/bin/bash -e

SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
source ${SCRIPT_DIR}/common-variable.sh

HOST_DOCKER_HOME=$SCRIPT_DIR/container/home/yocto
TARGET_HOME=/home/yocto

REMOTE_URL=$(git remote get-url origin)
BRANCH_NAME=$(git name-rev --name-only HEAD | sed "s/\W/_/g")
CONTAINER_NAME=$(basename $REMOTE_URL)--${BRANCH_NAME}--$(basename $SCRIPT_DIR)__$(git rev-parse --short HEAD)__$(date "+%Y%m%d-%H%M%S")

HOST_DOCKER_OPT=$SCRIPT_DIR/container/opt
TARGET_OPT=/opt

HOST_DL_DIR=$SCRIPT_DIR/container/home/yocto/downloads
TARGET_DL_DIR=$TARGET_HOME/downloads

mkdir -p $HOST_DOCKER_HOME
mkdir -p $HOST_DOCKER_OPT
mkdir -p $HOST_DL_DIR

COMMAND_ARG=$1
if [ x$COMMAND_ARG = x"build" ] ; then
      COMMAND_LINE=$TARGET_HOME/build-yocto.sh
      ADDITIONAL_OPT=
elif [ x$COMMAND_ARG = x"shell" ] ; then
      COMMAND_LINE=/bin/bash
      ADDITIONAL_OPT=-it
else
      echo usage:
      echo $0 build
      echo $0 shell
      exit 0
fi

docker run $ADDITIONAL_OPT --rm -u yocto:yocto \
      --name $CONTAINER_NAME \
      -v $HOST_DOCKER_OPT:$TARGET_OPT \
      -v $HOST_DL_DIR:$TARGET_DL_DIR \
      -v $HOST_DOCKER_HOME:$TARGET_HOME \
      -w $TARGET_HOME $DOCKERIMAGE $COMMAND_LINE
