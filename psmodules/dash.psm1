
function Get-MyDashBoard() {
	Write-Host "## Todo items for today:"
	Measure-JournalTodos
	chart
	Get-JournalTodayTodos
	Write-Host "## Agenda for today:"
	Get-JournalAgenda
	Write-Host "## GitHub Issues Assigned"
	Show-GHMine
	Write-Host "Use command 'todo' to list more tasks."
	Write-Host "Use command 'chart' to show todo item progress."
	Write-Host "Use command 'agenda' to list the plan for today."
}


Export-ModuleMember -Function Get-MyDashboard