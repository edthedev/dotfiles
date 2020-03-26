$TOYBOX_ROOT = "C:\src\dotfiles\toybox"
$TOYBOX_DOCKER_NAME = "secops"

function Show-Calendar {
  Write-Host "Hello Calendar."
      }
Export-ModuleMember -Function Show-Calendar

function New-DockerPython2 {
  docker build $TOYBOX_ROOT
  docker container create --name $TODYBOX_DOCKER_NAME e8cff83571c6
}

function Start-DockerPython2 {
  docker start $TOYBOX_DOCKER_NAME
}
function Start-DockerPython2Shell {
  docker exec $TOYBOX_DOCKER_NAME bash
  # Set-Location $TOYBOX_ROOT; docker run
}

function Start-DockerPythonBash {
  docker run -it python /bin/bash
}

# Export-ModuleMember -Function New-DockerPython2
# Export-ModuleMember -Function Start-DockerPython2
# Export-ModuleMember -Function Start-DockerPython2Shell
Export-ModuleMember -Function Start-DockerPythonBash
