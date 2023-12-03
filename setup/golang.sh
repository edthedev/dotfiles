if[! -f /usr/local/go/bin/go]
    echo "Install go to /usr/local/go/bin first!"
fi
ln -s /usr/local/go/bin/go ~/bin/go
ln -s /usr/local/go/bin/gofmt ~/bin/gofmt 