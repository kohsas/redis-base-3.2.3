FROM ubuntu:14.04
MAINTAINER ashok.satyanarayana@gmail.com
#
# docker build -t ashsat/redis-base:3.2.3 .
#
# docker run -i -t ashsat/redis-base:3.2.3 /bin/bash 
#  (cli)  docker run -link=redis0:redis -i -t -name=redis-cli ashsat/redis-base:3.2.3 /bin/bash 

RUN apt-get update
RUN apt-get install -y build-essential
ENV REDIS_VERSION 3.2.3
RUN wget http://download.redis.io/releases/redis-3.2.3.tar.gz
RUN tar xzf redis-$REDIS_VERSION.tar.gz
RUN cd redis-$REDIS_VERSION && make
RUN cd redis-$REDIS_VERSION && make install
