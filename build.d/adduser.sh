#!/bin/bash

echo -n "Username: "
read username
adduser -g tokopedia $username --password=$username123
echo "User added."

venvdir=/data/projects/development/$username
logdir=/data/logs/$username
homedir=/home/$username

mkdir -p $venvdir
mkdir -p $logdir
ln -s $venvdir $homedir/venv
chown $username:tokopedia $venvdir
chown $username:tokopedia $logdir
chown -h $username:tokopedia $homedir/venv

