FROM debian

RUN apt update
RUN apt install git -y

RUN \
  apt install -y nginx && \
  rm -rf /var/lib/apt/lists/* && \
  echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
  chown -R www-data:www-data /var/lib/nginx

RUN git clone https://github.com/DarlanSel/nginx-git-jenkins.git
RUN rm /var/www/html/*
RUN cp nginx-git-jenkins/html/* /var/www/html/

VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]

WORKDIR /etc/nginx

CMD ["nginx"]

# Expose ports.
EXPOSE 80
EXPOSE 443
