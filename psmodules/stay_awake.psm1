param($minutes=90)
$wsh = New-Object -ComObject WScript.Shell
do{
	"Staying awake for $minutes minutes"
  $minutes-=1;
  # Send Shift+F15
  $wsh.SendKeys('+{F15}')
  Start-Sleep -seconds 59
}until($minutes -lt 0)
# Thank you to http://www.zhornsoftware.co.uk/caffeine/
