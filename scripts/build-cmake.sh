#!/bin/bash

cmake ../Open-Fortress-Source/src -DCMAKE_BUILD_TYPE=RELEASE
make -j `nproc` $@