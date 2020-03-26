$TOYBOX_ROOT = "C:\src\dotfiles\toybox"
$TOYBOX_DOCKER_NAME = "secops"

function Start-DockerPythonBash {
  docker run -it python /bin/bash
}

# Export-ModuleMember -Function New-DockerPython2
# Export-ModuleMember -Function Start-DockerPython2
# Export-ModuleMember -Function Start-DockerPython2Shell
Export-ModuleMember -Function Start-DockerPythonBash
