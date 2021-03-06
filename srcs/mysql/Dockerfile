FROM alpine:3.12.3
RUN apk update && apk add openrc
RUN apk add mysql mysql-client
RUN openrc && touch /run/openrc/softlevel 
COPY files/script.sh /script.sh
RUN chmod 777 /script.sh
CMD ./script.sh