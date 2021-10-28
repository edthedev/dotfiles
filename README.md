# dotfiles

EdTheDev's Linux and Windows dot files. 
These are shared so that I can easily share a link to a tip or trick.

## Getting Started - Windows

> Note: Bookmark this guide. You're going to reboot at least a few times.

Optional - change host name
```
Rename-Computer -NewName FOOOOOOO -Restart
```

1. [Install chocolatey](https://chocolatey.org/install)

2. Tell `choco` to watch for reboots, as this is Windows.
```
choco feature enable -name=exitOnRebootDetected
```

3. Install a decent terminal. This invokes a bunch of KBs.
```powershell
choco install microsoft-windows-terminal # reboot after
```

3. Set dark theme (non-admin prompt)
```
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name AppsUseLightTheme -Value 0
```

4. Reboot after first setup - you may see errors in `choco` commands otherwise.
5. Set the PC time zone correctly - otherwise expect an install error in later `choco` commands.

4. More packages
```
choco install git 
choco install vscode
choco install powertoys # reboot after
```

```
git clone https://github.com/edthedev/dotfiles.git
cd dotfiles
code .
```

Admin prompt:
```
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
```

Install VSCode plugins:
```
.\setup\code-plugins.ps1
```

Set git username.
```
git config --global user.email "edward@delaporte.us"
git config --global user.name "Edward Delaporte"
```

## Getting Started - Raspberyy Pi

### Get Online

```sh
rasppi-config
```

+ Set up wireless
+ Set keyboard location

### Clone this repository

```sh
sudo apt-get install git
git clone https://github.com/edthedev/dotfiles.git
```

### Create a new user

```sh
sudo useradd bob -m -G sudo
sudo passwd bob
sudo passwd pi
```

### Boostrap CLI

```
sudo ./install_cli_basics.sh
```

## Installations

See the `\install` folder for scripts to install various handy utilities. Most of these rely on `Apt` on Linux, or `Chocolatey` on Windows.

## Setups

See the `\setup` folder for configurations.
These are, obviously, just my preferred configurations.

In general, these work by setting up symlinks on Linux, and on Windows by copying a stub file that sources the versioned file. 

Most of these are cross platform `.ps1` files that run under PowerShell.

## Further Reading

See `i3.md` for info on setting up the I3 window manager.
