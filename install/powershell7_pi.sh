
## https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-core-on-linux?view=powershell-7.1#raspbian


###################################
# Prerequisites

# Update package lists
sudo apt-get update

# Install libunwind8 and libssl1.0
# Regex is used to ensure that we do not install libssl1.0-dev, as it is a variant that is not required
sudo apt-get install '^libssl1.0.[0-9]$' libunwind8 -y

###################################
# Download and extract PowerShell

# Grab the latest tar.gz
if [ ! -d ~/.install/powershell.tar.gz ]; then
	wget https://github.com/PowerShell/PowerShell/releases/download/v7.1.2/powershell-7.1.2-linux-arm32.tar.gz ~/.install/powershell.tar.gz

	# Make folder to put powershell
	mkdir -p ~/powershell

	# Unpack the tar.gz file
	tar -xvf ./.install/powershell.tar.gz -C ~/powershell

fi

