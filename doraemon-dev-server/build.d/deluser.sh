#!/bin/bash

echo ""
logfile=/tmp/log/build-server.log
echo "Deleting User"
echo "-------------"

echo -n "Username: "
read username

echo -n "* (1/5) Deleting samba user ... "
smbpasswd -x $username 1>> $logfile
echo "Done"

echo -n "* (2/5) Deleting system user ... "
userdel -f -r $username
echo "Done"

devdir=/data/projects/development/$username
logdir=/data/logs/$username
homedir=/home/$username
smbconf=/etc/samba/smb.conf

echo -n "* (3/5) Cleaning $devdir ... "
rm -rf $devdir
echo "Done"

echo -n "* (4/5) Cleaning $logdir ... "
rm -rf $logdir
echo "Done"

echo -n "* (5/5) Cleaning $smbconf ... "
# Failed, multiline
# sed -ri "s/#BEGIN:${username}#.*#END:${username}#//g" $smbconf
echo "Done"

echo ""

