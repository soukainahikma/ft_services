FROM alpine:latest
RUN apk update
RUN apk add bash
RUN apk add nginx
RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
COPY files/nginx.conf /etc/nginx/nginx.conf
COPY files/index.html /www/index.html
RUN apk add vim
RUN apk add openrc
RUN rc-update add nginx default
RUN apk add openssl
RUN openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=mydomain.com" -addext "subjectAltName=DNS:mydomain.com" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt
#RUN openrc default
####################################
RUN apk add openssh
RUN rc-update add sshd
RUN rc-status
#RUN /etc/init.d/sshd start
COPY files/sshd_config /etc/ssh/sshd_config
COPY files/password /password
RUN adduser deploy < /password
#RUN /etc/init.d/sshd restart
#RUN ssh deploy@localhost -p 22
COPY files/script.sh /script.sh
RUN chmod 777 /script.sh
ENTRYPOINT ["/script.sh"]
