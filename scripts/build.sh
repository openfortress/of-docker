#!/bin/bash
export STEAM_RUNTIME_PATH=/usr
#export MAKE_VERBOSE=1

echo $PWD
ls

pushd Open-Fortress-Source/src

# Generate project files
./vpc_game_linux


# the whole `if` and `for` is just to let
# you pass in a series of targets, and have
# them all built one by one (ex: `build.sh mathlib client_ofd`)
if [ -z "$@" ]; then
  # this command builds `all-targets`
  make -f game_linux.mak
else
 for target in "$@"; do
  make -f game_linux.mak "$target"
 done
fi

popd