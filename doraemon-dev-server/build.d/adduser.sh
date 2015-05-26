#!/bin/bash

echo ""
echo "Adding User"
echo "-----------"
echo "* (1/6) Creating user"
echo -n "  > Username: "
read username
adduser -g tokopedia $username --password=$username123
echo "  > User $username was added with password as ${username}123"

devdir=/data/projects/development/$username
logdir=/data/logs/$username
homedir=/home/$username
echo -n "* (2/6) Creating $devdir ... "
mkdir -p $devdir/go
mkdir -p $devdir/node
echo "Done"
echo -n "* (3/6) Creating $logdir ... "
mkdir -p $logdir/go
mkdir -p $logdir/node
echo "Done"
echo -n "* (4/6) Creating symlink in $homedir ... "
ln -s $devdir $homedir/venv
ln -s $devdir/go $homedir/go
ln -s $devdir/node $homedir/node
ln -s $logdir $homedir/log
echo "Done"
echo -n "* (5/6) Changing ownership and permission ... "
mkdir -p $homedir/tmp
chown ${username}:tokopedia $homedir/tmp
chown ${username}:tokopedia $devdir
chown ${username}:tokopedia $logdir
chown -h ${username}:tokopedia $homedir/venv
chown -h ${username}:tokopedia $homedir/go
chown -h ${username}:tokopedia $homedir/node
chown -h ${username}:tokopedia $homedir/log
echo "Done"
echo -n "* (6/6) Updating profile ... "
echo "export NODE_ENV=development" >> /home/$username/.bashrc
echo "export GOPATH=${devdir}/go" >> /home/$username/.bashrc
echo "export PATH=\$PATH:\$GOPATH/bin" >> /home/$username/.bashrc
echo "Done"
echo ""

