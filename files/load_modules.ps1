
$env:psmodules = "$env:dotfiles\psmodules"
Import-Module "$env:psmodules\dash.psm1"
Import-Module $env:PSModules\file_management.psm1
Import-Module "$env:psmodules\fix_vpn.psm1"