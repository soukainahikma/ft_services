#!bin/bash
openrc default
rc-service mariadb restart
sleep 2
while sleep 1;
    do
        pgrep mysql > /dev/null
        mariadb_status=$?
        if [ $mariadb_status -ne 0 ]; then
            echo "mariadb service is not running ..."
            exit 1
            else
		    echo "mysql is up!"
        fi
    done

# ssh deploy@localhost -p 22
#Locate the following line of text in the warning message. Your values of path and x will be different:
#Offending RSA key in /path/.ssh/known_hosts:x
#Use your preferred text editor to open the /path/.ssh/known_hosts file.
#Delete the entire line of text indicated by number x.
#Save your changes to the file and exit the text editor.
#You should now be able to connect to the server using SSH.