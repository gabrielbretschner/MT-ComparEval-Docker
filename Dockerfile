FROM ubuntu:20.04
RUN apt-get update
RUN export DEBIAN_FRONTEND=noninteractive && apt-get install -y sqlite3 php7.4-cli php7.4-sqlite3 curl php7.4-mbstring php7.4-xml php7.4-curl git python
RUN ls
RUN git clone https://github.com/ondrejklejch/MT-ComparEval.git MT-ComparEval
WORKDIR MT-ComparEval
RUN bash bin/install.sh
COPY wrapper.sh wrapper.sh
RUN mkdir data
ENTRYPOINT bash ./wrapper.sh
