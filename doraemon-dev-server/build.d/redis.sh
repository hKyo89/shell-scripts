#!/bin.bash

echo ""
logfile=/tmp/log/build-server.log
echo "Installing Redis"
echo "----------------"
echo -n "* (1/5) Installing EPEL ... "
yum install -y epel-release 1>> $logfile
echo "Done"
echo -n "* (2/5) Installing Redis ... "
yum install -y redis 1>> $logfile
echo "Done"
echo -n "* (3/5) Starting Redis ... "
service redis start 1>> $logfile
echo "Done"
echo -n "* (4/5) Pingin redis ... "
redis-cli ping
echo -n "* (5/5) Updating chkconfig ... "
chkconfig --level 2345 redis on
echo "Done"
echo ""
