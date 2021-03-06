FROM alpine:3.12.3
RUN apk update
RUN wget https://dl.grafana.com/oss/release/grafana-7.4.3.linux-amd64.tar.gz
RUN tar -zxvf grafana-7.4.3.linux-amd64.tar.gz
#RUN apk add --update binutils | readelf -l grafana-server | grep "program interpreter"
RUN apk add libc6-compat
##########
RUN apk add influxdb
RUN apk add openrc
RUN rc-status && touch /run/openrc/softlevel
RUN rc-update add influxdb default
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories  
RUN apk add telegraf 
RUN rc-update add telegraf default
COPY files/telegraf.conf /etc/telegraf.conf
#############
COPY files/script.sh /script.sh
RUN chmod 777 /script.sh
CMD ./script.sh
#CMD ./grafana-server
############################
 