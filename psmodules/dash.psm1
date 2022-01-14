
function Show-MyDashBoard() {
	Write-Host "## Todo items for today:"
	Measure-JournalTodos
	chart
	Get-JournalTodayTodos
	Write-Host "## Agenda for today:"
	Get-JournalAgenda
	Write-Host "## GitHub Issues Assigned (Show-AgileMine)"
	Show-AgileMine -DaysAgo 6
	Write-Host "## GitHub Issues with no milestone. (Show-AgileNoMilestone)"
	Get-AgileNoMilestone -repository SecOps-Tools | Measure-Object -Property updated_at -Min -Max
	Write-Host "Use command 'todo' to list more tasks."
	Write-Host "Use command 'chart' to show todo item progress."
	Write-Host "Use command 'agenda' to list the plan for today."
}

function Show-MyTeamWork() {
	$team = @('ddriddle', 'zcarrington', 'tzturner', 'mpitcel', 'edthedev')
	$team | ForEach-Object {
		"## $_ - Issues Assigned"
		Get-AgileQuery -Assignee $_ | Invoke-AgileQuery | Show-MarkdownFromGitHub
	}
}

Export-ModuleMember -Function Show-MyDashboard
Export-ModuleMember -Function Show-MyTeamWork