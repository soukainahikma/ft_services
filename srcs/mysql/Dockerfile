FROM alpine:3.12.3
RUN apk update && apk add openrc
RUN apk add mysql mysql-client
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories  
RUN apk add telegraf
RUN openrc && touch /run/openrc/softlevel 
COPY files/script.sh /script.sh
COPY files/wordpress.sql /wordpress.sql
COPY files/telegraf.conf /etc/telegraf.conf
RUN chmod 777 /script.sh
CMD ./script.sh