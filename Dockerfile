FROM ubuntu:16.04

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10 \
    && echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' > /etc/apt/sources.list.d/mongodb.list \
    && apt-get update \
    && apt-get install -y mongodb-org-tools=3.0.12

WORKDIR /root/

ADD sync.sh /root/

CMD /root/sync.sh 
