FROM mysql:5.6

COPY custom-entrypoint.sh /custom-entrypoint.sh
COPY server.key /etc/mysql/server.key
COPY server.crt /etc/mysql/server.crt
COPY rootCA.crt /etc/mysql/rootCA.crt

RUN chmod -R a+rwX /custom-entrypoint.sh
RUN chown root:root /custom-entrypoint.sh

RUN chgrp -R 0 / \
  && chmod -R g+rwX /

ENTRYPOINT ["/custom-entrypoint.sh"]
CMD ["mysqld"]

