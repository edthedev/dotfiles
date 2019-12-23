
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

function Launch-Vault() {
  consul agent -dev # Run in Dev Mode
  vault sever -config c:\src\dotfiles\vaultconfig.hcl -address=http://127.0.0.1:8200 # Use local dev Consul as storage
}