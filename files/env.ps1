$env:Journal = "~\Journal" # allows cd $env:journal
$env:todolist = "C:\Users\delaport\Journal\"
# Tell my scripts which GitHub repositories to look in.
$env:GITHUB_USERNAME = 'edthedev'
$env:GITHUB_CLONE_PATH = '~\src'
$env:GITHUB_REPOS = @(
	'techservicesillinois/SecOps-Tools', 
	'techservicesillinois/secdev-job-aids', 
	'techservicesillinois/awscli-login', 
	'techservicesillinois/farmit',
	'uillinois-community/uillinois-community.github.io',
	'techservicesillinois/SecOps-Powershell-CSOC',
	'techservicesillinois/SecOps-Powershell-CISDSC',
	'techservicesillinois/secops-splunk-null-router'
) -join ' '
$ENV:TS_REPOS = $ENV:GITHUB_REPOS.split(' ') | Where { $_ -like 'techser*' }

