# dotfiles

EdTheDev's Linux and Windows dot files. These are shared so that I can easily share a link to a tip or trick.

## Bare Minimum

+ `install.sh` - Script I use to install packages on Linux, most typically a Raspberry Pi. 
+ `setup.sh` - Script I use to get to bare minimum (by my definition) setup on Linux - typically a Raspberry Pi.
+ `bootstrap.ps1` - Script I use to setup on Windows. Mostly relies on the `Chocolatey` package manager for Windows, of course.

## Installations

See the `\install` folder for scripts to install various handy utilities. Most of these rely on `Apt` on Linux, or `Chocolatey` on Windows.

## Setups

See the `\setup` folder for configurations.
These are, obviously, just my preferred configurations.

In general, these work by setting up symlinks on Linux, and on Windows by copying a stub file that sources the versioned file. 

Most of these are cross platform `.ps1` files that run under PowerShell.
