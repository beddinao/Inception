FROM debian:bookworm
RUN apt -qq upgrade -y && apt -qq update -y && apt -q install vim net-tools redis-server -y
###
COPY conf/redis_conf /etc/redis/redis.conf
###
CMD redis-server --protected-mode no
