
function Show-SprintCharts(){
    $closed = Get-GHClosed
    $closed_count = ($closed | Measure-Object).Count
	Add-Content -Path ~/.chart_closed -Value "|$closed_count"
	$env:closed =  Get-Content -Path ~/.chart_closed

    $orphans = Get-GHNoMilestone -repository SecOps-Tools
    $orphans_count = ($orphans | Measure-Object -Property updated_at -Min -Max).Count
	Add-Content -Path ~/.chart_orphans -Value "|$orphans_count"
	$env:orphans =  Get-Content -Path ~/.chart_orphans

    $unsized = Get-GHUnsized
    $unsized_count = ($unsized | Measure-Object).Count
	Add-Content -Path ~/.chart_unsized -Value "|$unsized_count"
	$env:unsized =  Get-Content -Path ~/.chart_unsized

    Write-Host "## Closed Issues this Sprint: $closed_count"
    Write-Host "'''sh"
    chart -var "closed"
    Write-Host "''' "
    Write-Host "## Count of Unsized Issues: $unsized_count"
    Write-Host "'''sh"
    chart -var "unsized"
    Write-Host "''' "
    Write-Host "## Count of Issues with no milestone: $orphans_count"
    Write-Host "'''sh"
    chart -var "orphans"
    Write-Host "''' "

}

Export-ModuleMember -Function Show-SprintCharts