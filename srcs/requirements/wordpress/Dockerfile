FROM debian:bullseye

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install wget -y && \
    apt-get install -y php-fpm\
    php-mysql\
    mariadb-client && \
    wget https://wordpress.org/latest.tar.gz && \
    tar -xvf latest.tar.gz && \
    mkdir -p /var/www/html/ && \
    mv wordpress/* /var/www/html/ && \
    rm -rf latest.tar.gz && \
    chown -R www-data:www-data /var/www/html/ && \
    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp && \
    wp core download --allow-root

COPY tools/auto_conf.sh /

COPY conf/www.conf /etc/php/7.4/fpm/pool.d

RUN chmod 777 auto_conf.sh

CMD ["/auto_conf.sh"]