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
CMD echo Connecting to ${REDIS_IP}:${REDIS_PORT} && \
    sed -i s/\{REDIS_IP\}/${REDIS_IP}/g /usr/local/etc/haproxy/haproxy.cfg && \
    sed -i s/\{REDIS_PORT\}/${REDIS_PORT}/g /usr/local/etc/haproxy/haproxy.cfg && \
    cat /usr/local/etc/haproxy/haproxy.cfg && \
    /etc/init.d/haproxy restart
