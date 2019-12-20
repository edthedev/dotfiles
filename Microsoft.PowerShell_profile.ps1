
# Path to Flutter
$ENV:PATH +=":/home/delaport/development/flutter/bin" # Kali under WSL

# Some Paths that are annoying to find/restore if the installer fails
$ENV:PATH+=";C:\Program Files\Python38\Scripts\;C:\Program Files\Python38\"
$ENV:PATH+=";C:\ProgramData\DockerDesktop\version-bin;C:\Program Files\Docker\Docker\Resources\bin"
$ENV:PATH+=";C:\Program Files (x86)\Common Files\Oracle\Java\javapath"
$ENV:PATH+=";C:\Program Files\Microsoft VS Code\bin"
$ENV:PATH+=";C:\Program Files\Git\cmd"
$ENV:PATH+=";C:\ProgramData\chocolatey\bin"
$ENV:PATH+=";C:\Program Files\nodejs" # KataKoda wants to add tools via npm
$ENV:PATH+=";C:\PENGUIN" # Flag to ensure my profile kicked in.
