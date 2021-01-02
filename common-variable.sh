#!/bin/bash

REMOTE_URL=$(git remote get-url origin)
IMAGEBASE=$(basename $REMOTE_URL)

SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
VERSION=1
DOCKERFILE_MD5=$(md5sum docker/Dockerfile | awk '{ print $1 }')
DOCKERIMAGE=$IMAGEBASE:$VERSION-$DOCKERFILE_MD5
