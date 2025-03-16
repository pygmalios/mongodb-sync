FROM mongo:8

WORKDIR /root/

COPY sync.sh /root/

CMD ["/root/sync.sh"]
