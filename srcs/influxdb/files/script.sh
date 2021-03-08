openrc default
rc-service influxdb restart
rc-service telegraf restart

while sleep 1;
		do
				pgrep influxd > /dev/null
				influxdb_status=$?
				if [ $influxdb_status -ne 0 ]; then
						echo "influxdb service is not running ..."
						exit
				fi
				pgrep telegraf > /dev/null
        		telegraf_status=$?
        		if [ $telegraf_status  -ne 0 ]; then
        		    echo "Telegraf service is not running ..."
        		    exit
        		fi
		done