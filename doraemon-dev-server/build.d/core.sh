#!/bin/bash

echo ""
echo "Installing Core Tools"
echo "----------------------------"
echo -n "* (1/4) Installing 'Development Tools' ... "
yum groupinstall -y --skip-broken 'Development Tools' 1> /dev/null
echo "Done"
echo -n "* (2/4) Installing wget ... "
yum install -y wget 1> /dev/null
echo "Done"
echo -n "* (3/4) Installing EPEL ... "
yum install -y epel-release 1> /dev/null
echo "Done"
echo -n "* (4/4) Installing Ack ... "
yum install -y ack 1> /dev/null
echo "Done"
unset SSH_ASKPASS
echo ""
