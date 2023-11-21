## Setup GitHub Key

1. Add new key to GitHub

	```sh
	cat ~/.ssh/id_rsa.pub
	```
	
	Visit <https://github.com/settings/keys>

1. Switch `dotfiles` to use SSH key access 

	Edit `.git/config`:
	
	```ini
	url = git@github.com:edthedev/dotfiles.git
	```

## Setup GitHub CLI

1. Install

	```powershell
	winget install --id GitHub.cli
	```

2. Authorize

	```powershell
	gh auth login
	```

## Setup PowerShell for GitHub

1. Install PowerShell for GitHub

	```powershell
	Install-Module -Name PowerShellForGitHub -Scope CurrentUser
	```

1. Clone my multi-repo helper scripts

	```powershell
	cd ~/src
	git clone git@github.com:uillinois-community/powershell-scripts.git

	```

1. Review the available commands

	```powershell
	get-command -module MarkDownGitHub
	get-command -module AgileGitHub
	```