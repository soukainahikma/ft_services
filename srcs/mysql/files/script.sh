sed -i "s/skip-networking/# skip-networking/g" /etc/my.cnf.d/mariadb-server.cnf
/etc/init.d/mariadb setup
rc-service mariadb start
mysql -e "create user 'shikma'@'%' identified by 'shikma'"
mysql -e "CREATE DATABASE wordpress"
mysql -e "GRANT ALL ON *.* to 'shikma'@'%'"
mysql -e "FLUSH PRIVILEGES"
sleep 2
while sleep 1;
    do
        mariadb_status=`rc-service mariadb status | grep -c 'start'`
        if [ $mariadb_status -ne 1 ]; then
            echo "mariadb service is not running ..."
            exit 1
        fi
    done