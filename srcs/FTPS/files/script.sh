openrc default
while sleep 1;
		do
				pgrep vsftpd > /dev/null
				vsftpd_status=$?
				if [ $vsftpd_status -ne 0 ]; then
						echo "vsftpd service is not running ..."
						exit
				fi
		done