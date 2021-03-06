
openrc default
rc-service influxdb restart
rc-service telegraf restart
cd /grafana-7.4.3/bin && ./grafana-server
while sleep 1;
		do
				pgrep grafana-server > /dev/null
				grafana_status=$?
				if [ $grafana_status -ne 0 ]; then
						echo "grafana service is not running ..."
						exit
				fi
		done