FROM debian:bookworm
RUN apt -qq upgrade -y && apt -qq update -y && apt -q install vim net-tools wget php-redis less php php-fpm php-mysql -y
RUN apt remove apache2 -y
###
COPY conf/php_stuff /etc/php/8.2/fpm/pool.d/www.conf
COPY conf/setup /setup_stuff
COPY conf/about /about
###
CMD bash /setup_stuff
