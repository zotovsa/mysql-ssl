FROM mysql:5.6

COPY custom-entrypoint.sh /opt/custom-entrypoint.sh
COPY server.key /etc/mysql/server.key
COPY server.crt /etc/mysql/server.crt
COPY rootCA.crt /etc/mysql/rootCA.crt

RUN chmod -R a+rwX /opt/custom-entrypoint.sh
RUN chown root:root /opt/custom-entrypoint.sh

RUN chgrp -R 0 /opt \
  && chmod -R g+rwX /opt \
  && chgrp -R 0 /etc \
  && chmod -R g+rwX /etc

ENTRYPOINT ["/opt/custom-entrypoint.sh"]
CMD ["mysqld"]

