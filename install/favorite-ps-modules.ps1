
# I trust PSGallery
Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted

# Install nice Git stuff.
Install-Module -Name posh-git
o