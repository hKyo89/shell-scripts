#!/bin/bash

echo ""
logfile=/tmp/log/build-server.log
echo "Installing Core Tools"
echo "----------------------------"
echo -n "* (1/5) Installing 'Development Tools' ... "
yum groupinstall -y --skip-broken 'Development Tools' 1>> $logfile
echo "Done"
echo -n "* (2/5) Installing wget ... "
yum install -y wget 1>> $logfile
echo "Done"
echo -n "* (3/5) Installing EPEL ... "
yum install -y epel-release 1>> $logfile
echo "Done"
echo -n "* (4/5) Installing Ack ... "
yum install -y ack 1>> $logfile
echo "Done"
echo -n "* (5/5) Installing screen ... "
yum install -y screen 1>> $logfile
echo "Done"
echo ""
