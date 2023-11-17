function Get-JournalAgenda() {
    agenda.exe -path "$HOME/Journal/{YYYY}/{MM}-{DD}.md"
}

function Show-MyDashBoard() {
	Write-Host ""
	Write-Host "## Todo items for today:"
	# Measure-JournalTodos
	chart
	# Get-JournalTodayTodos
	Write-Host ""
	Write-Host "## Agenda for today:"
	Get-JournalAgenda
	Write-Host ""
	Write-Host "## GitHub Issues Assigned (Show-AgileMine)"
	# Show-AgileMine
	# Show-AgileMine -DaysAgo 6
	Write-Host ""
	Write-Host "## GitHub Issues with no milestone. (Select-AgileNoMilestone)"
	Write-Host "(Get-AgileQuery -state 'Open' | Invoke-AgileQuery | Select-AgileNoMilestone | Show-MarkdownFromGitHub)"
	$milestone_repos = $env:github_repos.split(' ') | Where-Object { $_ -Match 'techservicesillinois' }
    # $queries = Get-AgileQuery -state 'Open' -repos $milestone_repos
	# Invoke-AgileQuery -queries $queries | Select-AgileNoMilestone | Show-MarkdownFromGitHub
	Write-Host ""
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