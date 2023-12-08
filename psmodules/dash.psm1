function Get-JournalAgenda() {
    agenda.exe -path "$HOME/Journal/{YYYY}/{MM}-{DD}.md"
}

function Measure-JournalTodos() {
	$todocount = todolist | Measure-Object -Line
	$env:todocount += '|'
	$env:todocount += $todocount.lines
}

<#

.SYNOPSIS

Show a text dashboard.

.EXAMPLE

Include `Todo` list.
Show-MyDashboard -todo

#>
function Show-MyDashBoard() {
	param(
		# [switch]$todocount=$true,
		[switch]$agenda=$true,
		[switch]$blocked,
		[switch]$gitHub,
		[switch]$help,
		[switch]$leeroy,
		[switch]$bugs,
		[switch]$todo,
		[switch]$pr,
		[switch]$requested,
		[switch]$orphans
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
	if($blocked){
		Write-Host ""
		Write-Host "## Blocked Issues:"
		Invoke-AgileCmd "gh issue list -l 'blocked'"
	}
	if($github) {
		Write-Host ""
		Write-Host "## GitHub Status (gh status)"
		Invoke-Expression "gh status"
	}
	if($leeroy){
		Write-Host ""
		Write-Host "## Leeroy Jenkins!:"
		Invoke-AgileCmd "gh issue list -l 'leeroy jenkins'"
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
	if($requested){
		Write-Host ""
		Write-Host "## Open Stakeholder Requests"
		invoke-agilecmd "gh issue list -S 'label:requested'"
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
	if($help) {
		Write-Host "## Dasbhoard Help"
		Get-Help Show-MyDashboard
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