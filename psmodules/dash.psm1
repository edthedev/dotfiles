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
		# [switch]$todocount=$true,
		[switch]$agenda=$true,
		[switch]$gitHub=$false,
		[switch]$bugs=$false,
		[switch]$todo=$false,
		[switch]$pr=$false,
		[switch]$orphans=$false
	)
	$todocount = $true
	if($todocount){
		Measure-JournalTodos
		Write-Host ""
		Write-Host "## Todo items for today: $env:todocount" 
		chart -var todocount
	}
	if($agenda){
		Write-Host ""
		Write-Host "## Agenda for today:"
		Get-JournalAgenda
	}
	if($github) {
		Write-Host ""
		Write-Host "## GitHub Status (gh status)"
		Invoke-Expression "gh status"
	}
	if($bugs) {
		Write-Host ""
		Write-Host "## Known Bugs"
		Invoke-AgileCmd "gh issue list -S 'label:bug'"
	}
	if($todo) {
		Write-Host ""
		Write-Host "## Todo List" 
		todolist
	}
	if($pr) {
		Write-Host ""
		Write-Host "## Open Pull Requests"
		Invoke-AgileCmd "gh pr list"
	}
	if($orphans) {
		Write-Host ""
		Write-Host "## Issues with No Milestone" 
		Invoke-AgileCmd "gh issue list -S 'is:open is:issue no:milestone'"
	}
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