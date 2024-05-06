FROM debian:bullseye

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install mariadb-server -y && \
    mkdir -p /var/lib/mysql /var/run/mysqld && \
    chown -R mysql:mysql /var/lib/mysql /var/run/mysqld && \
    chmod 777 /var/run/mysqld

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/script.sh /

RUN chmod 777 script.sh &&
    bash script.sh

ENTRYPOINT ["mysqld_safe"]
