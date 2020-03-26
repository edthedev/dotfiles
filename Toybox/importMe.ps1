
Remove-Module toybox

$modPaths = @("C:\src\dotfiles\toybox\toybox.psm1")
$modPaths | ForEach-Object {
  Write-Host $_
  $_ | Format-Table
  if(Test-Path -Path $_) {
    Import-Module $_
  }
}