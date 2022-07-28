#!/bin/bash

#edit these for your own mod:
DEFAULT_GAME_SOURCE_FOLDER=Open-Fortress-Source
DOCKER_FILE_PATH=of-i386-gcc
DOCKER_IMAGE_TAG=openfortress/steamrt-i386-gcc
BUILD_DOCKER=1

#internal use:
CFG_TYPE=
SOURCES_DIR=

if [ ! -d ccache ]; then
    mkdir ccache;
fi

if [ -z ${DEBUG} ];
    then
        CFG_TYPE=release      
    else
        CFG_TYPE=debug
        echo "WARNING: Generating debug build."
fi

if [ -z ${GAME_SRC_DIR} ];
    then
        SOURCES_DIR=$PWD/$DEFAULT_GAME_SOURCE_FOLDER
    else
        SOURCES_DIR=$GAME_SRC_DIR
fi

if [ "${BUILD_DOCKER}" -eq 1 ]; then
    docker build \
        --build-arg USER_ID="$(id -u)" \
        --build-arg GROUP_ID="$(id -g)" \
        $DOCKER_FILE_PATH \
        -t $DOCKER_IMAGE_TAG
fi

docker run \
    -e CFG=$CFG_TYPE \
    -e CCACHE_DIR=/ofd/ccache \
    -it \
    -v $PWD/ccache:/ofd/ccache \
    -v $PWD/scripts:/ofd/scripts \
    -v $SOURCES_DIR:/ofd/$DEFAULT_GAME_SOURCE_FOLDER \
    -w /ofd $DOCKER_IMAGE_TAG \
    ./scripts/build.sh $@
