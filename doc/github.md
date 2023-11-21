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