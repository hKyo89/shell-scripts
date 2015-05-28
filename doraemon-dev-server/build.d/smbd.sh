#!/bin/bash

echo ""
logfile=/tmp/log/build-server.log
echo "Installing Samba"
echo "----------------"
echo -n "* (1/6) Installing samba ... "
yum install samba samba-client samba-common 1>> $logfile
echo "Done"

echo -n "* (2/6) Checking version ... "
smbd --version

echo -n "* (3/6) Starting chkconfig samba ... "
chkconfig smb on
chkconfig nmb on
echo "Done"

smbconf=/etc/samba/smb.conf

echo -n "* (4/6) Backing up config ... "
cp $smbconf ${smbconf}.bak
rm $smbconf
touch $smbconf
echo "Done"

echo -n "* (5/6) Writing basic config ... "
cat << EOF >> $smbconf
[global]
guest account= nobody
map to guest = bad user
security     = user

EOF
echo "Done"

echo -n "* (5/6) Restarting samba ... "
smbd restart
echo "Done"

setenforce 0

echo ""

