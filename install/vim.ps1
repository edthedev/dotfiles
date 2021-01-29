<#
.SYNOPSIS

Install Vim for Windows in the EdTheDev configuration.

.DESCRIPTION

Include Vim-Plug for plugin management.

.NOTES

Requires Chocolatey package manager.

#>
PowerShellGet\Install-Module posh-git -Scope CurrentUser -AllowPrerelease -Force

choco install vim

# Install vim-plug
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni $HOME/vimfiles/autoload/plug.vim -Force

# Deploy a stub file to source my vimrc when on Windows.
cp win_vimrc ~/.vimrc

Write-Host "Be sure to run PlugInstall within Vim."