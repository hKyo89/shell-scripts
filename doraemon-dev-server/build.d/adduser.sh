#!/bin/bash

echo ""
echo "Adding User"
echo "-----------"
echo "* (1/6) Creating user"
echo -n "  > Username: "
read username
password=${username}123*
adduser -g tokopedia $username
echo "$username:$password" | chpasswd
echo "  > User $username was added with password as $password"

devdir=/data/projects/development/$username
logdir=/data/logs/$username
homedir=/home/$username
echo -n "* (2/6) Creating $devdir ... "
mkdir -p $devdir/go
mkdir -p $devdir/go/bin
mkdir -p $devdir/go/pkg
mkdir -p $devdir/go/src
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
chown -R ${username}:tokopedia $homedir/tmp
chown -R ${username}:tokopedia $devdir
chown -R ${username}:tokopedia $logdir
chown -h ${username}:tokopedia $homedir/*
echo "Done"
echo -n "* (6/6) Updating profile ... "
echo "export NODE_ENV=development" >> $homedir/.bashrc
echo "export GOPATH=${devdir}/go" >> $homedir/.bashrc
echo "export PATH=\$PATH:\$GOPATH/bin" >> $homedir/.bashrc
echo "unset SSH_ASKPASS" >> $homedir/.bashrc
echo "Done"
echo ""

