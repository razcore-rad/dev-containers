export extern "dev build" [...argv: string] {
  let CONTAINER = (pwd | path basename)
  docker build $argv --rm $"--build-arg=USER_ID=(id -u)" $"--build-arg=GROUP_ID=(id -g)" -t $"razcorerad/($CONTAINER)" .
}

export extern "dev run" [container = "", ...argv: string] {
  let USERNAME = ubuntu

  let XSOCK = /tmp/.X11-unix
  let XAUTH = /tmp/.docker.xauth
  let XARGS = [--env=DISPLAY --env=XAUTHORITY=($XAUTH) --volume=($XSOCK):($XSOCK):ro --volume=($XAUTH):($XAUTH):ro]
  xauth nlist $env.DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -

  let WORKDIR = (pwd | path basename)
  let CONTAINER = if ($container | is-empty) { $WORKDIR } else { $container }
  docker run $argv -it --rm --name $WORKDIR $XARGS $"--volume=($env.HOME)/.ssh:/home/($USERNAME)/.ssh:ro" $"--volume=.:/home/($USERNAME)/work" $"razcorerad/($CONTAINER)"
}

export extern "dev in" [container = "", ...argv: string] {
  let SHELL = nu
  let CONTAINER = (pwd | path basename)
  docker exec $argv -it $CONTAINER $SHELL
}
