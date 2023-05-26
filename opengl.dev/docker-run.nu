#!/usr/bin/env nu
let XSOCK = /tmp/.X11-unix
let XAUTH = /tmp/.docker.xauth
xauth nlist $env.DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -
docker run -it --env=DISPLAY $"--env=XAUTHORITY=($XAUTH)" $"--volume=($XSOCK):($XSOCK):ro" $"--volume=($XAUTH):($XAUTH)" --volume=.:/root/work --rm razcorerad/opengl.dev
