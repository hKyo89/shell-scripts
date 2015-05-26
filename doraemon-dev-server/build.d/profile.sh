#!/bin/bash

echo ""
echo "Setting Up Profile"
echo "------------------"
echo -n "* (1/1) Set locale as en_US ... "
echo "export LC_ALL=en_US.UTF-8" >> /etc/profile
export LC_ALL=en_US.UTF-8
echo "Done"
echo ""
