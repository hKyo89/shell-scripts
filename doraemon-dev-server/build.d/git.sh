#!/bin/bash

echo ""
echo "Installing Git"
echo "------------"
echo -n "* (1/5) Updating rpm ... "
rpm -i 'http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm' 1> /dev/null
echo "Done"
echo -n "* (2/5) Importing rpm key ... "
rpm --import http://apt.sw.be/RPM-GPG-KEY.dag.txt 1> /dev/null
echo "Done"
echo -n "* (3/5) Installing git ... "
yum install -y git --enablerepo=rpmforge-extras 1> /dev/null
echo "Done"
echo -n "* (4/5) Checking version ... "
git --version
echo -n "* (5/5) Cleaning repo ... "
yum clean all 1> /dev/null
echo "Done"
echo ""
