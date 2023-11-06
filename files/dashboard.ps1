# Dashboard
New-Alias dash   Show-MyDashboard # from dash.psm1

function Get-JournalAgenda() {
	agenda.exe -path "$HOME/Journal/{YYYY}/{MM}-{DD}.md"
}
New-Alias today Get-JournalAgenda