#!/bin/bash

cmake ../$DEFAULT_GAME_SOURCE_FOLDER/src
make -j `nproc`