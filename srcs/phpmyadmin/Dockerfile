FROM alpine:3.12.3
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
RUN apk add php7-fpm php7-mcrypt php7-soap php7-openssl php7-gmp php7-pdo_odbc php7-json php7-dom php7-pdo php7-zip php7-mysqli php7-sqlite3 php7-apcu php7-pdo_pgsql php7-bcmath php7-gd php7-odbc php7-pdo_mysql php7-pdo_sqlite php7-gettext php7-xmlreader php7-xmlrpc php7-bz2 php7-iconv php7-pdo_dblib php7-curl php7-ctype php7-session php7-mbstring
RUN wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz
RUN tar zxvf phpMyAdmin-5.0.2-all-languages.tar.gz
RUN rm phpMyAdmin-5.0.2-all-languages.tar.gz
RUN mv phpMyAdmin-5.0.2-all-languages phpmyadmin
RUN mv /phpmyadmin /www/phpmyadmin
RUN mkdir /www/phpmyadmin/tmp && chmod 777 /www/phpmyadmin/tmp
COPY files/config.inc.php /www/phpmyadmin/config.inc.php
RUN ln -s /www/phpmyadmin/ /var/www/localhost/htdocs/phpmyadmin
COPY files/script.sh /script.sh

RUN chmod 777 /script.sh
ENTRYPOINT ["/script.sh"]
