# dotfiles

EdTheDev's Linux and Windows dot files. 
These are shared so that I can easily share a link to a tip or trick.

## Getting Started - Windows

1. [Install chocolatey](https://chocolatey.org/install)
2. Install a decent terminal. This invokes a bunch of KBs.
```powershell
choco install microsoft-windows-terminal
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
choco install code
choco install powertoys
 
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
