#!/bin/bash

echo ""
logfile=/tmp/log/build-server.log
echo "Setting Up Usergroup"
echo "--------------------"
echo -n "* (1/1) Adding tokopedia group ... "
groupadd tokopedia -g600 -f
adduser -g tokopedia tokopedia
echo "Done"
echo ""
