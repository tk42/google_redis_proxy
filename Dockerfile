###############################
##
## Accessing GCP Memorystore from local machines
## https://stackoverflow.com/questions/50281492/accessing-gcp-memorystore-from-local-machines
##
## Example:
## $ export REDIS_IP=<YOUR REDIS IP>
## $ docker run .
###############################
FROM haproxy
COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg
CMD echo Connecting to ${REDIS_IP} \
    sed s/\{REDIS_IP\}/${REDIS_IP}/ /usr/local/etc/haproxy/haproxy.cfg \
    cat /usr/local/etc/haproxy/haproxy.cfg
