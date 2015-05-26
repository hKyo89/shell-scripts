#!/bin/bash

echo ""
echo "Adding User"
echo "-----------"
echo "* (1/5) Creating user"
echo -n "  > Username: "
read username
adduser -g tokopedia $username --password=$username123
echo "  > User $username was added with password as ${username}123"

devdir=/data/projects/development/$username
logdir=/data/logs/$username
homedir=/home/$username
echo -n "* (2/5) Creating $devdir ... "
mkdir -p $devdir
echo "Done"
echo -n "* (3/5) Creating $logdir ... "
mkdir -p $logdir
echo "Done"
echo -n "* (4/5) Creating symlink in $homedir ... "
ln -s $devdir $homedir/venv
echo "Done"
echo -n "* (5/5) Changing ownership and permission ... "
chown $username:tokopedia $devdir
chown $username:tokopedia $logdir
chown -h $username:tokopedia $homedir/venv
echo "Done"
echo ""

