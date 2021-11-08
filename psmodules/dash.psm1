
function Get-MyDashBoard() {
	Write-Host "## Todo items for today:"
	Measure-JournalTodos
	chart
	Get-JournalTodayTodos
	Write-Host "## Agenda for today:"
	Get-JournalAgenda
	Write-Host "## GitHub Issues Assigned"
	Show-GHMine
	Write-Host "## GitHub Issues with no milestone. (Show-GHNoMilestone)"
	Get-GHNoMilestone | Measure-Object -Property updated_at -Min -Max
	Write-Host "Use command 'todo' to list more tasks."
	Write-Host "Use command 'chart' to show todo item progress."
	Write-Host "Use command 'agenda' to list the plan for today."
}

Export-ModuleMember -Function Get-MyDashboard