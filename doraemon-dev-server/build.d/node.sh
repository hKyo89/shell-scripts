#!/bin/bash

echo ""
logfile=/tmp/log/build-server.log
echo "Installing Node.js"
echo "------------------"
echo -n "* (1/6) Downloading node.js ... "
wget -P /tmp/ "http://nodejs.org/dist/v0.12.4/node-v0.12.4-linux-x64.tar.gz" 1>> $logfile
echo "Done"
echo -n "* (2/6) Extracting package ... "
tar xzvf node-v* 1>> $logfile
echo "Done"
echo -n "* (3/6) Installing node.js ... "
mv /tmp/node-v* /usr/bin/node
echo "Done"
echo -n "* (4/6) Updating profile ... "
echo "export PATH=\$PATH:/usr/bin/node/bin" >> /etc/profile.d/node.sh
echo "Done"
echo -n "* (5/6) Checking version ... "
node --version
echo -n "* (6/6) Cleaning up installation files ... "
echo "Nodejs installed."
rm -rf /tmp/node-v*
echo "Done"
echo ""
