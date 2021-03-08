#!bin/bash
openrc default
rc-service telegraf restart
rc-service nginx restart
while sleep 1;
    do
        pgrep nginx > /dev/null
        nginx_status=$?
        if [ $nginx_status -ne 0 ]; then
            echo "Nginx service is not running ..."
            exit
        fi
        pgrep telegraf > /dev/null
        telegraf_status=$?
        if [ $telegraf_status  -ne 0 ]; then
            echo "Telegraf service is not running ..."
            exit
        fi
    done