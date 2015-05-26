#!/bin/bash

echo ""
logfile=/tmp/log/build-server.log
echo "Installing Go"
echo "-------------"
echo "* (1/5) Downloading go"
cd /tmp && git clone https://go.googlesource.com/go 1>> $logfile
echo "* (2/5) Changing go version to 1.4.2"
mv /tmp/go /usr/bin/
cd /usr/bin/go
git checkout go1.4.2
echo "* (3/5) Installing go"
cd src
./all.bash
echo -n "* (4/5) Update profile ... "
echo "export PATH=\$PATH:/usr/bin/go/bin" >> /etc/profile.d/go.sh
echo "Done"
echo -n "* (5/5) Installing go-tools ... "
mkdir -p /root/go
export GOPATH=/root/go
echo "export GOPATH=/root/go" >> /root/.bashrc
go get golang.org/x/tools/cmd/...
echo "Done"
echo ""
