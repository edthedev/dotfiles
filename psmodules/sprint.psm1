function Show-SprintPlan(){
    Write-Host "## Stats"
    $closed = Get-GHClosed
    $closed_count = ($closed | Measure-Object).Count
    $orphans = (Get-GHNoMilestone -repository SecOps-Tools | Measure-Object -Property updated_at -Min -Max).Count
    $unsized = Get-GHUnsized
    $unsized_count = ($unsized | Measure-Object).Count
    Write-Host "Closed Issues this Sprint: $closed_count"
    Write-Host "Count of Unsized Issues: $unsized_count"
    Write-Host "Count of Issues with no milestone: $orphans"
    Write-Host "## Closed Issues Updated this Sprint (Show-GHClosed)"
    $closed | Show-GHIssuesAsMarkdown
    Write-Host "## Unsized Issues (Show-GHUnsized)"
    $unsized | Show-GHIssuesAsMarkdown
}
Export-ModuleMember -Function Show-SprintPlan