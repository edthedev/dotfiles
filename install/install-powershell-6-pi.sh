echo "Install PowerShell 6.2.0"

if [ ! -d /opt/powershell ]; then

cd /tmp
wget https://github.com/PowerShell/PowerShell/releases/download/v6.2.0/powershell-6.2.0-linux-arm32.tar.gz
mkdir /opt/powershell
tar -xvf ./powershell-6.2.0-linux-arm32.tar.gz -C /opt/powershell

echo "PowerShell is now at /opt/powershell/pswsh"
echo "Remember to update your path."

fi

ln -s /opt/powershell/pwsh /usr/bin/pwsh
ls /usr/bin/pwsh -alis
chmod 755 -R /opt/powershell/pwsh
rm /opt/powershell/DELETE_ME_TO_DISABLE_CONSOLEHOST_TELEMETRY

