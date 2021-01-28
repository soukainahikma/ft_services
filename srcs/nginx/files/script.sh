#!bin/bash
openrc default
/etc/init.d/sshd restart
# ssh deploy@localhost -p 22
/bin/sh
#Locate the following line of text in the warning message. Your values of path and x will be different:
#Offending RSA key in /path/.ssh/known_hosts:x
#Use your preferred text editor to open the /path/.ssh/known_hosts file.
#Delete the entire line of text indicated by number x.
#Save your changes to the file and exit the text editor.
#You should now be able to connect to the server using SSH.