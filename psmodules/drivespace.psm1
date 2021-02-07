<#
.SYNOPSIS

Find 10 largest files on the C drive.

#>
function Show-LargeFiles() {
	 Get-ChildItem c:\ -r| sort -descending -property length | select -first 10 name, Length, FullName
}

<#
.SYNPOSIS

Display the free space on the C drive.

#>
function Show-Drivespace() {
	Get-PSDrive C | Select-Object Used,Free
}

Export-ModuleMember -Function Show-Drivespace 
Export-ModuleMember -Function Show-LargeFiles
