#!/bin/bash

echo ""
echo "Installing Samba"
echo "----------------"
echo -n "* (1/5) Installing samba ... "
yum install samba samba-client samba-common 1> /dev/null
echo "Done"
echo -n "* (2/5) Checking version ... "
smbd --version
echo -n "* (3/5) Starting chkconfig samba ... "
chkconfig smb on
chkconfig nmb on
echo "Done"
echo -n "* (4/5) Backing up config ... "
cp /etc/samba/smb.conf /etc/samba/smb.conf.bak
rm /etc/samba/smb.conf
touch /etc/samba/smb.conf
echo "Done"
echo -n "* (5/5) Restarting samba ... "
smbd restart
echo "Done"
echo ""

