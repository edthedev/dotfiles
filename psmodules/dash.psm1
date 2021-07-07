
function Get-MyDashBoard() {
	Measure-JournalTodos
	chart
	# todo
	# Get-JournalAgenda
	Write-Host "Todo items for today:"
	Get-JournalTodayTodos
  Write-Host "GitHub Issues Assigned"
  Show-GHMine
	Write-Host "Use command 'todo' to list more tasks."
	Write-Host "Use command 'agenda' to list the plan for today."
}


Export-ModuleMember -Function Get-MyDashboard