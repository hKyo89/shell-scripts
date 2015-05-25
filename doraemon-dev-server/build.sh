#!/bin/bash

echo ""
echo "Installing Development Tools"
echo "----------------------------"
yum groupinstall -y 'Development Tools'
echo "Devtools installed."
yum install -y wget
echo "wget installed."

echo ""
echo "Updating Git"
echo "------------"
rpm -i 'http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm'
echo "rpm updated."

rpm --import http://apt.sw.be/RPM-GPG-KEY.dag.txt
echo "rpm key imported."

yum install -y git --enablerepo=rpmforge-extras
echo "Git updated."
git --version

yum clean all
echo "Repo cleaned."

echo ""
echo "Installing Nginx"
echo "----------------"
yum install -y epel-release
echo "EPEL installed."

yum install -y nginx
echo "Nginx installed."

echo ""
echo "Installing Node.js"
echo "------------------"
cd /tmp/
wget "http://nodejs.org/dist/v0.12.4/node-v0.12.4-linux-x64.tar.gz"
tar xzvf node-v*
mv node-v* /usr/bin/node
rm -rf node-v*
echo "export PATH=$PATH:/usr/bin/node/bin" >> /etc/profile.d/node.sh
make install
node --version
echo "Nodejs installed."
cd ..
rm -rf ./node-v*
echo "Installation files cleaned."
