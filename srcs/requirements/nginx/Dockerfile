FROM debian:bullseye

RUN apt-get update && \
    apt-get install openssl nginx -y && \
    mkdir -p /etc/nginx/ssl && \
    openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=ES/ST=MLG/L=Málaga/O=42/OU=42/CN=pbengoec.42.malaga/UID=pbengoec" && \
    mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/conf.d/

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]
