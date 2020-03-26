$TOYBOX_ROOT = "C:\src\dotfiles\toybox"
$TOYBOX_DOCKER_NAME = "secops"

function Start-DockerPythonBash {
  docker run -it python /bin/bash
}

Export-ModuleMember -Function Start-DockerPythonBash
