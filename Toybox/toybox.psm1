$TOYBOX_ROOT = "C:\src\dotfiles\toybox"

function Start-DockerPythonBash {
  docker run -it python /bin/bash
}

Export-ModuleMember -Function Start-DockerPythonBash
