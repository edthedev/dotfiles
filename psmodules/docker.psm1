<#
.SYNPOSIS

Spin up a quick Python docker container.

#>
function Start-DockerPython{
  docker run -it python /bin/bash
}

Export-ModuleMember -Function Start-DockerPython

# function Export-VSCodeExtensions {
#  code --list-extensions | Out-File -FilePath /src/dotfiles/vscode-extensions.txt
#  Get-Content -Path /src/dotfiles/vscode-extensions.txt
#}
