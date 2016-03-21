#!/bin/bash
#
#
## conecta.sh - é um shellscript para conectar e enviar o ip para duckdns
#
#
## Flávio Lages
## contato@flaviolages.com
## Versão: 1.0
# 
#
#
#
## TIMNE = Tempo conectado
#
#
TIME=14400
# 4horas



#Implantação futura
#TIME="/var/www/html/core/time.txt"



sleep 30
wvdial &

sleep 120
/srv/rc/duckdns.sh

sleep 120
/etc/init.d/ntp restart

sleep 60
ping -c 10 google.com 2> /dev/null

sleep 120
/srv/rc/duckdns.sh

sleep $TIME
kill -9 $(ps -ef | grep wvdial | awk '{print $2}')
