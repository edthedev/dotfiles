$TOYBOX_ROOT = "C:\src\dotfiles\toybox"
$TOYBOX_DOCKER_NAME = "secops"

function Show-Calendar {
  Write-Host "Hello Calendar."
      }
Export-ModuleMember -Function Show-Calendar

function New-DockerPython26 {
  docker build $TOYBOX_ROOT
  docker container create --name $TODYBOX_DOCKER_NAME e8cff83571c6
}

function Start-Python2 {
  docker start $TOYBOX_DOCKER_NAME
  docker exec $TOYBOX_DOCKER_NAME bash
  # Set-Location $TOYBOX_ROOT; docker run
}