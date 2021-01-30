Set-ExecutionPolicy RemoteSigned

Show file extensions for known types - run once
Set-Location HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced
Set-ItemProperty . HideFileExt "0"
Set-Location C:\

