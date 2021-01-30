$TOYBOX_ROOT = "C:\src\dotfiles\toybox"

# function Start-DockerPythonWhatever {
#   docker run -it python /bin/bash
# }

# Export-ModuleMember -Function Start-DockerPythonWhatever
#
function Find-LargeFiles() {
	 Get-ChildItem c:\ -r| sort -descending -property length | select -first 10 name, Length, FullName
}

function List-DriveSpace() {
	Get-PSDrive C | Select-Object Used,Free
}

# function Export-VSCodeExtensions {
#  code --list-extensions | Out-File -FilePath /src/dotfiles/vscode-extensions.txt
#  Get-Content -Path /src/dotfiles/vscode-extensions.txt
#}

Export-ModuleMember -Function List-DriveSpace
Export-ModuleMember -Function List-LargeFiles

