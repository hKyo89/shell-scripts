#!/bin/bash

echo ""
echo "Deleting User"
echo "-------------"
echo "* (1/3) Deleting user"
echo -n "  > Username: "
read username
userdel -f -r $username
echo "  > User $username was removed"

devdir=/data/projects/development/$username
logdir=/data/logs/$username
homedir=/home/$username
echo -n "* (2/3) Cleaning $devdir ... "
rm -rf $devdir/go
rm -rf $devdir/node
echo "Done"
echo -n "* (3/3) Cleaning $logdir ... "
rm -rf $logdir/go
rm -rf $logdir/node
echo "Done"
echo ""

