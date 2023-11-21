function Get-JournalAgenda() {
    agenda.exe -path "$HOME/Journal/{YYYY}/{MM}-{DD}.md"
}

function Measure-JournalTodos() {
	$todocount = todolist | Measure-Object -Line
	$env:todocount += '|'
	$env:todocount += $todocount.lines
}

function Show-MyDashBoard() {
	param(
		[bool]$gitHub=$true
	)
	Write-Host ""
	Measure-JournalTodos
	Write-Host "## Todo items for today: $env:todocount" 
	chart -var todocount
	Write-Host ""
	Write-Host "## Agenda for today:"
	Get-JournalAgenda
	Write-Host ""
	if($github) {
		Write-Host "## GitHub Issues Assigned (Show-AgileMine)"
		Show-AgileMine
		Show-AgileMine -DaysAgo 6
		Write-Host ""
		Write-Host "## GitHub Issues with no milestone. (Select-AgileNoMilestone)"
		Write-Host "(Get-AgileQuery -state 'Open' | Invoke-AgileQuery | Select-AgileNoMilestone | Show-MarkdownFromGitHub)"
		$milestone_repos = $env:github_repos.split(' ') | Where-Object { $_ -Match 'techservicesillinois' }
		$queries = Get-AgileQuery -state 'Open' -repos $milestone_repos
		Invoke-AgileQuery -queries $queries | Select-AgileNoMilestone | Show-MarkdownFromGitHub
	}
	Write-Host ""
	Write-Host "Use command 'todolist' to list more tasks."
	Write-Host "Use command 'chart -var todocount' to show todo item progress."
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