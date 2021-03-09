FROM alpine:3.12.3
RUN apk update
RUN wget https://dl.grafana.com/oss/release/grafana-7.4.3.linux-amd64.tar.gz
RUN tar -zxvf grafana-7.4.3.linux-amd64.tar.gz
RUN apk add libc6-compat
RUN apk add openrc
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories  
RUN apk add telegraf 
RUN rc-update add telegraf default
COPY files/telegraf.conf /etc/telegraf.conf
RUN mv grafana-7.4.3 grafana
COPY files/grafana.db /grafana/data/grafana.db
COPY files/script.sh /script.sh
RUN chmod 777 /script.sh
CMD ./script.sh

 