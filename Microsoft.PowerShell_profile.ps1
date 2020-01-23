
# Kali linux env
$ENV:PATH +=":/home/delaport/development/flutter/bin" # Flutter in Kali under WSL

# Some Paths that are annoying to find/restore if the installer fails
$ENV:PATH+=";C:\Program Files\Microsoft VS Code\bin" # One Editor to rule them all
$ENV:PATH+=";C:\Program Files\Python38\Scripts\;C:\Program Files\Python38\" # Python latest as of 2019 December
$ENV:PATH+=";C:\ProgramData\DockerDesktop\version-bin;C:\Program Files\Docker\Docker\Resources\bin" # Docker for R Studio and Jupyter
$ENV:PATH+=";C:\Program Files (x86)\Common Files\Oracle\Java\javapath" # Don't remember why I still care about Java.
$ENV:PATH+=";C:\Program Files\Git\cmd" # Version control is nice.
$ENV:PATH+=";C:\ProgramData\chocolatey\bin" # Package management is nice.
$ENV:PATH+=";C:\Program Files\nodejs" # KataKoda wants to add tools via npm
$ENV:PATH+=";C:\PENGUIN" # Flag to ensure my profile kicked in.

function Start-Vault() {
  consul agent -dev # Run in Dev Mode
  vault sever -config c:\src\dotfiles\vaultconfig.hcl -address=http://127.0.0.1:8200 # Use local dev Consul as storage
}

function New-DockerRStudio() {
  docker run --name=rpython -Pit -p 8888:8888 -p 8787:8787 -p 8022:22 -p 6006:6006 -v c:\src\data:/mnt/data datascienceschool/rpython
}
function Start-DockerRStudio() {
  docker start rpython
  Write-Host "R Studio is running at http://localhost:8787/"
  Write-Host "Jupyter is running at http://localhost:8888/"
}

function Start-DockerOWASPZap() {
  Param(
    [string]$URL
  )
  # https://github.com/zaproxy/zaproxy/wiki/Docker
  docker run owasp/zap2docker-stable
  docker run -i owasp/zap2docker-stable zap-cli quick-scan --self-contained --start-options '-config api.disablekey=true' $URL
  Write-Host "https://github.com/zaproxy/zaproxy/wiki/Docker"
}


function Start-DockerWebGoat() {
  docker pull webgoat/webgoat-8.0 
  docker run -p 8080:8080 -t webgoat/webgoat-8.0
  Write-Host "Vulnerable Webgoat running on 8080"
}

function Start-JuiceShop() {
  docker pull bkimminich/juice-shop
  docker run --rm -p 3000:3000 bkimminich/juice-shop
  Write-Host "Vulnerable Juice Shop running on 3000"
}
