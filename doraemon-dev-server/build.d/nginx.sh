#!/bin.bash

echo ""
echo "Installing Nginx"
echo "----------------"
echo -n "* (1/2) Installing EPEL ... "
yum install -y epel-release 1> /dev/null
echo "Done"
echo -n "* (2/2) Installing Nginx ... "
yum install -y nginx 1> /dev/null
echo "Done"
echo ""
