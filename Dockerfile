FROM mysql:5.6

COPY custom-entrypoint.sh /custom-entrypoint.sh
COPY server.key /etc/mysql/server.key
COPY server.crt /etc/mysql/server.crt
COPY rootCA.crt /etc/mysql/rootCA.crt

RUN chmod -R a+rwX /custom-entrypoint.sh

ENTRYPOINT ["/custom-entrypoint.sh"]
CMD ["mysqld"]

