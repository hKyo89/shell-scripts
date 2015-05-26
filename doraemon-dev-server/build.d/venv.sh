#!/bin/bash

echo ""
logfile=/tmp/log/build-server.log
echo "Setting Up Working Environment"
echo "------------------------------"
devdir=/data/projects/development
logdir=/data/logs
echo -n "* (1/3) Creating $devdir dir ... "
mkdir -p /data/projects/development
echo "Done"
echo -n "* (2/3) Creating $logdir dir ... "
mkdir -p /data/logs
echo "Done"
echo -n "* (3/3) Changing ownership and permission ... "
chown -R tokopedia:tokopedia /data
chmod -R 775 /data
echo "Done"
echo ""
