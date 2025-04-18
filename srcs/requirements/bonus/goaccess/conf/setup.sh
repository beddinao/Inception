#!/bin/bash

cat /var/log/nginx/access.log
cat /var/certs/certificate.crt
cat /var/certs/certificate.key
mkdir -v /var/www/html/

goaccess /var/log/nginx/access.log \
	-o /var/www/html/report.html \
	--log-format=COMBINED \
	--real-time-html \
	--ssl-cert=/var/certs/certificate.crt \
	--ssl-key=/var/certs/certificate.key \
	--ws-url=wss://$ip_addr:7890
