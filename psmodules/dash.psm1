
function Get-MyDashboard() {
  $MyDashboard = New-UDDashboard -Title "Hello, World" -Content {
    New-UDCard -Title "Hello, Universal Dashboard" -Content {
      New-UDParagraph -Text 'I am a very simple card. I am good at containing small bits of information. I am convenient because I require little markup to use effectively.'
    } -Links @(
      New-UDLink -Text 'This is a link' -Url '#!'
      New-UDLink -Text 'This is a link' -Url '#!'
      ) -Size 'small'
    }
  }
  return $MyDashboard
}

function Inovke-MyDashboard() {
  Start-UDDashboard -Port 1000 -Dashboard Get-MyDashboard
  Write-Host "http://localhost:1000"
}

Export-ModuleMember -Function Invoke-MyDashboard