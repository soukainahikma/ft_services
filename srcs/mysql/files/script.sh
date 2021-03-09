rc-service telegraf restart
if [ ! -d "/var/lib/mysql/wordpress/" ]; then
    /etc/init.d/mariadb setup
    rc-service mariadb start
    mysql -e "create user 'shikma'@'%' identified by 'shikma'"
    mysql -e "CREATE DATABASE wordpress"
    mysql < /wordpress.sql
    mysql -e "GRANT ALL ON *.* to 'shikma'@'%'"
    mysql -e "FLUSH PRIVILEGES"
    rc-service mariadb stop 
fi
rc-service mariadb start
#mysqld_safe &

sleep 2
while sleep 1;
    do
        pgrep mysql > /dev/null
        mariadb_status=$?
        if [ $mariadb_status  -ne 0 ]; then
            echo "Mariadb service is not running ..."
            exit 1
        fi
        pgrep telegraf > /dev/null
        telegraf_status=$?
        if [ $telegraf_status  -ne 0 ]; then
            echo "Telegraf service is not running ..."
            exit
        fi
    done