#!/bin/bash
wp config set DB_NAME $DB_NAME --allow-root --path=/var/www/html/
wp config set DB_USER $DB_USER --allow-root --path=/var/www/html/
wp config set DB_PASSWORD $DB_PWD --allow-root --path=/var/www/html/
wp config set DB_HOST mariadb --allow-root --path=/var/www/html/
wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root --path=/var/www/html/
wp user create $WP_USR $WP_EMAIL_2 --role=author --user_pass=$WP_PWD --allow-root --path=/var/www/html/
wp option update siteurl $DOMAIN_NAME --allow-root --path=/var/www/html/
wp option update home $DOMAIN_NAME --allow-root --path=/var/www/html/
wp option get siteurl --allow-root --path=/var/www/html/
wp option get home --allow-root --path=/var/www/html/
if [ ! -e "/run/php" ]; then
    mkdir /run/php
fi

/usr/sbin/php-fpm7.4 -y /etc/php/7.4/fpm/php-fpm.conf -F