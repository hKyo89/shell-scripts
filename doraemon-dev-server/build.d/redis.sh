#!/bin.bash

echo ""
echo "Installing Redis"
echo "----------------"
echo -n "* (1/5) Installing EPEL ... "
yum install -y epel-release 1> /dev/null
echo "Done"
echo -n "* (2/5) Installing Redis ... "
yum install -y redis 1> /dev/null
echo "Done"
echo -n "* (3/5) Starting Redis ... "
service redis start 1> /dev/null
echo "Done"
echo -n "* (4/5) Pingin redis ... "
redis-cli ping
echo -n "* (5/5) Updating chkconfig ... "
chkconfig --level 2345 redis on
echo "Done"
echo ""
