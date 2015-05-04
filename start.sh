#!/bin/bash

set -u
set -e

ELK_HOST=${ELK_HOST:-'localhost'}

sed  -i 's/%ELK_HOST%/'${ELK_HOST}'/g' /etc/logstash-forwarder.conf

#service logstash-forwarder start

echo "Starting supervisor"	
service supervisor start
