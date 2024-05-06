#!/bin/bash

service mariadb start
mariadb -u root -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
mariadb -u root -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PWD';"
mariadb -u root -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';"
mariadb -u root -e "FLUSH PRIVILEGES;"
mariadb -u root -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$DB_ROOT_PWD');"
mariadb -u root -e "FLUSH PRIVILEGES;"
mariadb -u root -p$DB_ROOT_PWD -e "GRANT ALL ON *.* TO 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PWD';"
mariadb -u root -p$DB_ROOT_PWD -e "FLUSH PRIVILEGES;"
service mariadb stop