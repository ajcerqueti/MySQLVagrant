#!/usr/bin/env bash

# Update apt
sudo apt-get update
# sudo apt-get -y upgrade

#sudo apt-get install -y curl python-software-properties mysql-server

# Set defaults
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password \"''\""
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password \"''\""

# Install
sudo apt-get -y install mysql-server emacs24-nox

# Configure
sudo sed -i "s/^bind-address/#bind-address/" /etc/mysql/my.cnf
mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '' WITH GRANT OPTION; FLUSH PRIVILEGES; SET GLOBAL max_connect_errors=10000;"

# Restart
sudo service mysql restart
