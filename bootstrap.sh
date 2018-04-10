#!/usr/bin/env bash

# Update apt
echo -e "Updating packages...\n"
sudo apt-get update
echo -e "Done\n"

# Set defaults
echo -e "Setting passwords... "
DEFAULTPASS="password"
sudo debconf-set-selections <<EOF
mysql-server    mysql-server/root_password password $DEFAULTPASS
mysql-server    mysql-server/root_password_again password $DEFAULTPASS
dbconfig-common dbconfig-common/mysql/app-pass password $DEFAULTPASS
dbconfig-common dbconfig-common/mysql/admin-pass password $DEFAULTPASS
dbconfig-common dbconfig-common/password-confirm password $DEFAULTPASS
dbconfig-common dbconfig-common/app-password-confirm password $DEFAULTPASS
EOF
echo -e "Done\n"

# Install MySQL
echo -e "Installing MySQL... "
sudo apt-get install mysql-server-5.7 mysql-client emacs24-nox --assume-yes --force-yes
echo -e "Done\n"

# Add privileges
echo -e "Granting permission to the host machine... "
mysql -u root --password=$DEFAULTPASS -e "grant all privileges on *.* to 'root'@'%' identified by '$DEFAULTPASS' with grant option; flush privileges;"
sudo cp /vagrant/mysql/mysqld.cnf /etc/mysql/mysql.conf.d/
echo -e "Done\n"

# Restart MySQL
echo -e "Restarting MySQL Service... "
sudo service mysql restart
echo -e "Done\n"

echo -e "Installation complete!\n\n"
