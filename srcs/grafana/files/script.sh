openrc default
rc-service telegraf restart
cd /grafana/bin && ./grafana-server
sleep 2
while sleep 1;
		do
				pgrep grafana-server > /dev/null
				grafana_status=$?
				if [ $grafana_status -ne 0 ]; then
						echo "grafana service is not running ..."
						exit
				fi
				pgrep telegraf > /dev/null
        		telegraf_status=$?
        		if [ $telegraf_status  -ne 0 ]; then
        		    echo "Telegraf service is not running ..."
        		    exit
        		fi
		done