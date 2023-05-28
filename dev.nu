export extern "dev build" [...argv: string] {
  docker build $argv --rm $"--build-arg=USER_ID=(id -u)" $"--build-arg=GROUP_ID=(id -g)" -t $"razcorerad/(pwd | path basename)" .
}

export extern "dev run" [...argv: string] {
  let XSOCK = /tmp/.X11-unix
  let XAUTH = /tmp/.docker.xauth
  xauth nlist $env.DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -
  let USERNAME = ubuntu
  docker run $argv -it --rm --env=DISPLAY $"--env=XAUTHORITY=($XAUTH)" $"--volume=($XSOCK):($XSOCK):ro" $"--volume=($XAUTH):($XAUTH)" $"--volume=($env.HOME)/.ssh:/home/($USERNAME)/.ssh" $"--volume=.:/home/($USERNAME)/work" $"razcorerad/(pwd | path basename)"
}