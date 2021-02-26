FROM alpine:3.12.3
RUN apk update && apk add openrc
RUN apk add bash
RUN apk add mysql mysql-client
RUN rc-status && touch /run/openrc/softlevel 
RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql
RUN rc-update add mariadb default
# RUN rc-service mariadb start
COPY files/pass.sql /pass.sql
RUN service mariadb start && mysqladmin -u root password toor
COPY files/script.sh /script.sh
RUN chmod 777 /script.sh
CMD ./script.sh