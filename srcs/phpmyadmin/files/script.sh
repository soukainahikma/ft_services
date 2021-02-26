#!bin/bash
openrc default
/etc/init.d/sshd restart
rc-service php-fpm7 start
rc-service nginx start

while sleep 1;
    do
        pgrep nginx > /dev/null
        nginx_status=$?
        if [ $nginx_status -ne 0 ]; then
            echo "Nginx service is not running ..."
            exit
        fi
        # pgrep telegraf > /dev/null
        # telegraf_status=$?
        # if [ $telegraf_status  -ne 0 ]; then
        #     echo "Telegraf service is not running ..."
        #     exit
        # fi
        pgrep sshd > /dev/null
        sshd_status=$?
        if [ $sshd_status  -ne 0 ]; then
            echo "sshd is not running ..."
            exit
        fi
        pgrep php-fpm7 > /dev/null
        php-fpm7_status=$?
        if [ $php-fpm7_status -ne 0 ]; then
            echo "php-fpm7 service is not running ..."
            exit
        fi
    done

#/etc/init.d/sshd restart
# ssh deploy@localhost -p 22
/bin/sh