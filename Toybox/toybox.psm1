$TOYBOX_ROOT = "C:\src\dotfiles\toybox"

# function Start-DockerPythonWhatever {
#   docker run -it python /bin/bash
# }

# Export-ModuleMember -Function Start-DockerPythonWhatever
#
function List-LargeFiles() {
	 Get-ChildItem c:\ -r| sort -descending -property length | select -first 10 name, Length, FullName
}

function Get-DriveSpace() {
	Get-PSDrive C | Select-Object Used,Free
}

# function Export-VSCodeExtensions {
#  code --list-extensions | Out-File -FilePath /src/dotfiles/vscode-extensions.txt
#  Get-Content -Path /src/dotfiles/vscode-extensions.txt
#}

Export-ModuleMember -Function Get-DriveSpace
Export-ModuleMember -Function List-LargeFiles

