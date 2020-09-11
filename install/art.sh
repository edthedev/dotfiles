mkdir -p ~/.installed

if [ ! -f ~/.installed/gimp ]; then
	sudo apt-get install gimp
	touch ~/.installed/gimp
fi

ls -al ~/.installed
