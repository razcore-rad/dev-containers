export extern "dev build" [...argv: string] {
  docker build $argv --rm $"--build-arg=USER_ID=(id -u)" $"--build-arg=GROUP_ID=(id -g)" -t $"razcorerad/(pwd | path basename)" .
}

export extern "dev run" [...argv: string] {
  let USERNAME = ubuntu
  let XSOCK = /tmp/.X11-unix
  let XAUTH = /tmp/.docker.xauth
  let CONTAINER = (pwd | path basename)
  xauth nlist $env.DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -
  docker run $argv -it --rm --name $CONTAINER --env=DISPLAY $"--env=XAUTHORITY=($XAUTH)" $"--volume=($XSOCK):($XSOCK):ro" $"--volume=($XAUTH):($XAUTH):ro" $"--volume=($env.HOME)/.ssh:/home/($USERNAME)/.ssh:ro" $"--volume=.:/home/($USERNAME)/work" $"razcorerad/($CONTAINER)"
}

export extern "dev in" [...argv: string] {
  let SHELL = nu
  let CONTAINER = (pwd | path basename)
  docker exec $argv -it $CONTAINER $SHELL
}
