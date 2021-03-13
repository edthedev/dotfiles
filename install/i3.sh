if [ ! -f ~/.installed/i3 ]; then
	echo "************** Install i3 Window Manager"
	sudo apt-get install i3
	touch ~/.installed/i3
fi
