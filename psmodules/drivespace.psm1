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
	Get-PSDrive C | Select-Object Used,Free | ForEach {
		Write-Host "Free space GB: " ($_.Free / 1GB)
		Write-Host "Used space GB: " ($_.Used / 1GB)
	}
}


Export-ModuleMember -Function Show-Drivespace 
Export-ModuleMember -Function Show-LargeFiles
