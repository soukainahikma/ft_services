#!bin/bash
openrc default
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
#Locate the following line of text in the warning message. Your values of path and x will be different:
#Offending RSA key in /path/.ssh/known_hosts:x
#Use your preferred text editor to open the /path/.ssh/known_hosts file.
#Delete the entire line of text indicated by number x.
#Save your changes to the file and exit the text editor.
#You should now be able to connect to the server using SSH.