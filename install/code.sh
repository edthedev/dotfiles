if [ ! -d ~/.installed/code ]; then
	echo "************** Install Visual Studio Code"
	# sudo apt install snapd
	# sudo snap install --classic code
	wget https://packagecloud.io/headmelted/codebuilds/gpgkey -O - | sudo apt-key add -
  curl -L https://raw.githubusercontent.com/headmelted/codebuilds/master/docs/installers/apt.sh | sudo bash
	touch ~/.installed/code
fi
