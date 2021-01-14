<#
.SYNOPSIS
Some notes on using the SalesForce API.

.NOTES

Requires PsIni

> Install-Module PsIni

#>

$FileContent = Get-IniContent ".salesforce.conf"

$url = $FileContent['salesforce']['url']
Write-Output $url

$aboutAPI = curl $url

$aboutAPI | Format-List

# Write-Output $aboutAPI.
