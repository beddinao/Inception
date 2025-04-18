FROM debian:bookworm
RUN apt -qq upgrade -y && apt -qq update -y && apt -q install vim net-tools mariadb-server -y
###
COPY conf/my.cnf /etc/mysql/
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY conf/init_.sh /init_.sh
###
COPY conf/database_setup.sh /
CMD bash /init_.sh
