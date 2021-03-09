openrc default
rc-service telegraf restart
sleep 2
while sleep 1;
		do
				pgrep vsftpd > /dev/null
				vsftpd_status=$?
				if [ $vsftpd_status -ne 0 ]; then
						echo "vsftpd service is not running ..."
						exit
				fi
				pgrep telegraf > /dev/null
        		telegraf_status=$?
        		if [ $telegraf_status  -ne 0 ]; then
        		    echo "Telegraf service is not running ..."
        		    exit
        		fi
		done