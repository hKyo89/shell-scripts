#!/bin/bash

echo ""
echo "Installing Go"
echo "-------------"
echo "* (1/4) Downloading go"
cd /tmp && git clone https://go.googlesource.com/go 1> /dev/null
echo "* (2/4) Changing go version to 1.4.2"
mv /tmp/go /usr/bin/
cd /usr/bin/go
git checkout go1.4.2
echo "* (3/4) Installing go"
cd src
./all.bash
echo -n "* (4/4) Update profile ... "
echo "export PATH=$PATH:/usr/bin/go/bin" >> /etc/profile.d/go.sh
echo "Done"
echo ""
