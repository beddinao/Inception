FROM debian:bookworm
RUN apt -qq update -y && apt -qq upgrade -y && apt -q install adminer php php-curl php-cli php-mysql php-gd php-fpm -y
RUN apt remove apache2 -y
RUN mv /usr/share/adminer/adminer.php /usr/share/adminer/index.php
CMD ["php", "-S", "[::]:1001", "-t", "/usr/share/adminer/"]
