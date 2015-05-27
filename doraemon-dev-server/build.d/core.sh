#!/bin/bash

echo ""
logfile=/tmp/log/build-server.log
echo "Installing Core Tools"
echo "----------------------------"
echo -n "* (1/6) Installing 'Development Tools' ... "
yum groupinstall -y --skip-broken 'Development Tools' 1>> $logfile
echo "Done"
echo -n "* (2/6) Installing wget ... "
yum install -y wget 1>> $logfile
echo "Done"
echo -n "* (3/6) Installing EPEL ... "
yum install -y epel-release 1>> $logfile
echo "Done"
echo -n "* (4/6) Installing Ack ... "
yum install -y ack 1>> $logfile
echo "Done"
echo -n "* (5/6) Installing screen ... "
yum install -y screen 1>> $logfile
echo "Done"
echo -n "* (6/6) Installing pip ... "
yum install -y python-pip 1>> $logfile
echo "Done"
echo ""
