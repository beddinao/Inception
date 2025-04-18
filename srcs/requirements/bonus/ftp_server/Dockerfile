FROM debian:bookworm
RUN apt -qq update -y && apt -qq upgrade -y && apt -q install passwd openssl vsftpd -y
###
COPY conf/vsftpd_conf /etc/vsftpd.conf
COPY conf/_start_ftp /_start.sh
###
CMD bash /_start.sh
