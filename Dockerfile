###############################
##
## Accessing GCP Memorystore from local machines
## https://stackoverflow.com/questions/50281492/accessing-gcp-memorystore-from-local-machines
##
## Example:
## $ export REDIS_IP={YOUR REDIS IP}
## $ docker run .
###############################
FROM haproxy
COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg
RUN echo ${REDIS_IP}
RUN sed s/\{REDIS_IP\}/${REDIS_IP}/ /usr/local/etc/haproxy/haproxy.cfg
RUN cat /usr/local/etc/haproxy/haproxy.cfg