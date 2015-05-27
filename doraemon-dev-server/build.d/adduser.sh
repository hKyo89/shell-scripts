#!/bin/bash

echo ""
logfile=/tmp/log/build-server.log
echo "Adding User"
echo "-----------"

echo -n "  > Username: "
read username
password=${username}123*

echo -n "* (1/9) Creating system user ... "
adduser -g tokopedia $username
echo "$username:$password" | chpasswd
echo "Done. User $username was added with password as $password"

devdir=/data/projects/development/$username
logdir=/data/logs/$username
homedir=/home/$username

echo -n "* (2/9) Creating $devdir ... "
mkdir -p $devdir/go
mkdir -p $devdir/go/bin
mkdir -p $devdir/go/pkg
mkdir -p $devdir/go/src
mkdir -p $devdir/node
echo "Done"

echo -n "* (3/9) Creating $logdir ... "
mkdir -p $logdir/go
mkdir -p $logdir/node
echo "Done"

echo -n "* (4/9) Creating symlink in $homedir ... "
ln -s $devdir $homedir/venv
ln -s $devdir/go $homedir/go
ln -s $devdir/node $homedir/node
ln -s $logdir $homedir/log
echo "Done"

echo -n "* (5/9) Changing ownership and permission ... "
mkdir -p $homedir/tmp
chown -R ${username}:tokopedia $homedir/tmp
chown -R ${username}:tokopedia $devdir
chown -R ${username}:tokopedia $logdir
chown -h ${username}:tokopedia $homedir/*
echo "Done"

echo -n "* (6/9) Updating profile ... "
echo "export NODE_ENV=development" >> $homedir/.bashrc
echo "export GOPATH=${devdir}/go" >> $homedir/.bashrc
echo "export PATH=\$PATH:\$GOPATH/bin" >> $homedir/.bashrc
echo "unset SSH_ASKPASS" >> $homedir/.bashrc
echo "Done"

echo "* (7/9) Adding samba user"
echo -n "  > "
smbpasswd -a $username

echo -n "* (8/9) Setting up samba config ... "
smbconf=/etc/samba/smb.conf
cat << EOF >> $smbconf

#BEGIN:${username}#
[${username}]
path        = /data/projects/development/${username}
valid users = ${username}
browsable   = yes
writable    = yes
public      = yes
available   = yes
guest ok    = no
read only   = no
#END:${username}#
EOF
echo "Done"

echo -n "* (9/9) Reloading samba config ... "
service smb reload 1>> $logfile
echo "Done"

echo ""

