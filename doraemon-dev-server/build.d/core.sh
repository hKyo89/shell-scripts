#!/bin/bash

echo ""
echo "Installing Core Tools"
echo "----------------------------"
echo -n "* (1/5) Installing 'Development Tools' ... "
yum groupinstall -y --skip-broken 'Development Tools' 1> /dev/null
echo "Done"
echo -n "* (2/5) Installing wget ... "
yum install -y wget 1> /dev/null
echo "Done"
echo -n "* (3/5) Installing EPEL ... "
yum install -y epel-release 1> /dev/null
echo "Done"
echo -n "* (4/5) Installing Ack ... "
yum install -y ack 1> /dev/null
echo "Done"
echo -n "* (5/5) Installing screen ... "
yum install -y screen 1> /dev/null
echo "Done"
echo ""
