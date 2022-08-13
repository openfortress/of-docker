# of-docker
resources to setup the docker image we use to build the game

**NOTE: The repo is under heavy restructuring and the below will not work.**

~~## Super quick setup~~

~~If you just need to quickly setup stuff to compile for linux, clone this repo, then clone the Open-Fortress-Source repo and place it inside this folder, so you should have `of-docker/README.md` as this file and `of-docker/Open-Fortress-Source` as the folder containing the source code to the game.~~

~~Then all you have to do is run the following to generate linux binaries in `of-docker/Open-Fortress-Source/game/bin`:~~

```
./run-docker.sh
```

~~## More complex options~~

~~If you have an already existing source code repository and you don't want to move it inside the repo, you can specify its location with the `GAME_SRC_DIR` environment variable. For example:~~

```
GAME_SRC_DIR=/path/to/Open-Fortress-Source ./run-docker.sh
```

~~In addition, you can enable the debug build (WARNING: USUALLY NOT WORKING) by setting the `DEBUG` environment variable to 1:~~

```
DEBUG=1 ./run-docker.sh
```

~~Also, any parameters you have will be passed through to the underlying vpc scripts. The most useful is `clean` which cleans all build binaries, but you can also specify a specific project to build such as `GameUI` or `client`:~~

```
./run-docker clean
```

If you have any questions about this script please talk to Fenteale on discord.
~~