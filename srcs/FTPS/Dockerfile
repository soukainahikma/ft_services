FROM alpine:3.12.3
RUN apk update && apk add openrc && apk add vsftpd
RUN rc-update add vsftpd default
RUN apk add openssl
RUN openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=mydomain.com" \
    -addext "subjectAltName=DNS:mydomain.com" -newkey rsa:2048 \
    -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem
RUN adduser -D user
RUN echo "user:pass1234" | /usr/sbin/chpasswd
RUN echo "user" | tee -a /etc/vsftpd.userlist
COPY ./files/vsftpd.conf /etc/vsftpd/vsftpd.conf
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories  
RUN apk add telegraf 
RUN openrc && touch /run/openrc/softlevel 
COPY files/telegraf.conf /etc/telegraf.conf
COPY files/script.sh /script.sh
RUN chmod 777 /script.sh
CMD ./script.sh
