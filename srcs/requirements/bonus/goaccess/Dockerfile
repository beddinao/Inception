FROM debian:bookworm
RUN apt -qq update -y && apt -qq upgrade -y && apt -q install wget tar gcc build-essential make openssl libssl-dev libncurses-dev -y
###
RUN wget https://tar.goaccess.io/goaccess-1.9.2.tar.gz && tar -xvf goaccess-1.9.2.tar.gz
RUN cd goaccess-1.9.2 && ./configure --with-openssl && make && make install
###
COPY conf/setup.sh /go_access_setup.sh
CMD bash /go_access_setup.sh
