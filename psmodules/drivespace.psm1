<#
.SYNOPSIS

Find 10 largest files on the C drive.

#>
function Show-LargeFiles() {
	param(
		[int]$Max=10
	)
	Get-ChildItem c:\ -r| sort -descending -property length | select -first $Max name, Length, FullName
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

function Show-DrivespacePretty() {
	Start-Job -Name "FileCollection" -ScriptBlock { Show-Drivespace }
While((Get-Job -Name "FileCollection").State -eq "Running") {
	     Write-Progress -Activity "Collecting Files..." -PercentComplete $x
	If($x -eq 100){
		$x = 1
	}
	Else{
		$x += 1
	}
}
Write-Progress -Activity "Collecting Files..." -Completed
$Files = Get-Job -Name "FileCollection" | Receive-Job
Get-Job -Name "FileCollection" | Remove-Job
}

Export-ModuleMember -Function Show-Drivespace 
Export-ModuleMember -Function Show-LargeFiles
