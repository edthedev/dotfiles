
function Show-SprintPlan(){
    param(
        [switch]$list = $false,
        [switch]$chart = $false
    )
    Write-Host "## Stats"
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

    if($chart) {
        chart -var "closed"
    }
    Write-Host "Closed Issues this Sprint: $closed_count"
    if($chart) {
        chart -var "unsized"
    }
    Write-Host "Count of Unsized Issues: $unsized_count"
    if($chart) {
        chart -var "orphans"
    }
    Write-Host "Count of Issues with no milestone: $orphans_count"

    if($list) {
        Write-Host "## Closed Issues Updated this Sprint (Show-GHClosed)"
        $closed | Show-GHIssuesAsMarkdown
        Write-Host "## Unsized Issues (Show-GHUnsized)"
        $unsized | Show-GHIssuesAsMarkdown
        Write-Host "## Issues with No Milestone"
        $orphans | Show-GHIssuesAsMarkdown
    }

}
Export-ModuleMember -Function Show-SprintPlan