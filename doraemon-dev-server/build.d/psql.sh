#!/bin/bash

echo ""
logfile=/tmp/log/build-server.log
echo "Installing PostgreSQL"
echo "---------------------"
echo -n "* (1/8) Downloading rpm ... "
yum install http://yum.postgresql.org/9.4/redhat/rhel-6-x86_64/pgdg-redhat94-9.4-1.noarch.rpm 1>> $logfile
echo "Done"
echo -n "* (2/8) Installing PostgreSQL ... "
yum install postgresql94 postgresql94-server 1>> $logfile
echo "Done"
echo -n "* (3/8) Initializing database ... "
service postgresql-9.4 initdb 1>> $logfile
echo "Done"
echo -n "* (4/8) Starting server ... "
service postgresql-9.4 start 1>> $logfile
echo "Done"
echo -n "* (5/8) Starting chkconfig ... "
chkconfig postgresql-9.4 on 1>> $logfile
echo "Done"
echo -n "* (6/8) Updating config to listen * ... "
conffile=/var/lib/pgsql/9.4/data/postgresql.conf
cp $conffile ${conffile}.bak
sed -ri "s/(#)(listen_addresses[ ]*=[ ]*)\"localhost\"/\2\"*\"/g" $conffile
echo "Done"
echo -n "* (7/8) Updating host to listen * ... "
cp /var/lib/pgsql/9.4/data/pg_hba.conf /var/lib/pgsql/9.4/data/pg_hba.conf.bak
echo "host all all 0.0.0.0/0 md5" >> /var/lib/pgsql/9.4/data/pg_hba.conf
echo "Done"
echo -n "* (8/8) Restarting server ... "
service postgresql-9.4 restart 1>> $logfile
echo "Done"
echo ""
echo "PostgreSQL is now running!"
echo ""
echo "You may want to setup user and database:"
echo "# su - postgres"
echo "# psql"
echo "psql> CREATE USER user_name WITH ENCRYPTED PASSWORD 'user_password';"
echo "psql> CREATE DATABASE db_name OWNER user_name;"
echo ""
