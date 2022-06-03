FROM ubuntu:bionic

MAINTAINER KEERTHI

ENV NGINX_VERSION 1.14.0-0ubuntu1.10

RUN apt-get update && apt-get install -y curl

RUN apt-get update && apt-get install -y nginx=$NGINX_VERSION

WORKDIR /var/www/html

ADD https://www.free-css.com/assets/files/free-css-templates/download/page279/jack-and-rose.zip .

EXPOSE 80

HEALTHCHECK CMD curl localhost:80

VOLUME ["/usr/share/nginx/html/"]

CMD ["nginx", "-g", "daemon off;"]

STOPSIGNAL SIGTERM
