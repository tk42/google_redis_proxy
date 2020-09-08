###############################
##
## Accessing GCP Memorystore from local machines
## https://stackoverflow.com/questions/50281492/accessing-gcp-memorystore-from-local-machines
##
## Example:
## $ export REDIS_IP=<YOUR REDIS IP>
## $ export REDIS_PORT=<YOUR REDIS PORT>
## $ docker run .
###############################
FROM haproxy
COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg
COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["haproxy", "-f", "/usr/local/etc/haproxy/haproxy.cfg"]
