FROM debian:bookworm
RUN apt -qq update -y && apt -qq upgrade -y && apt -q install vim net-tools nginx openssl -y
COPY conf/default /etc/nginx/sites-available/
COPY conf/nginx_fire_sh /
###
RUN mkdir -p /etc/nginx/certs/
RUN openssl req -nodes -x509 -newkey rsa:4096 \
	-keyout /etc/nginx/certs/certificate.key \
	-out /etc/nginx/certs/certificate.crt -days 365 \
	-subj "/C=MA/O=1337/OU=Inception/CN=beddinao.1337.ma"
###
EXPOSE 443/tcp
CMD bash /nginx_fire_sh
