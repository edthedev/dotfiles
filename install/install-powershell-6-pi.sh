echo "Install PowerShell 6.2.0"
cd /tmp
wget https://github.com/PowerShell/PowerShell/releases/download/v6.2.0/powershell-6.2.0-linux-arm32.tar.gz
mkdir ~/powershell
tar -xvf ./powershell-6.2.0-linux-arm32.tar.gz -C ~/powershell

echo "PowerShell is now at ~/powershell/pswsh"
echo "Remember to update your path."
