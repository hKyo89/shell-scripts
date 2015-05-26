#!/bin.bash

echo ""
logfile=/tmp/log/build-server.log
echo "Installing Nginx"
echo "----------------"
echo -n "* (1/2) Installing EPEL ... "
yum install -y epel-release 1>> $logfile
echo "Done"
echo -n "* (2/2) Installing Nginx ... "
yum install -y nginx 1>> $logfile
echo "Done"
echo ""
