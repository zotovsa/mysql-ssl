FROM mysql:5.6

ADD custom-entrypoint.sh /opt/custom-entrypoint.sh
ADD server.key /etc/mysql/server.key
ADD server.crt /etc/mysql/server.crt
ADD rootCA.crt /etc/mysql/rootCA.crt

USER root
RUN chmod -R a+rwX /opt/custom-entrypoint.sh
RUN chown root:root /opt/custom-entrypoint.sh

RUN chgrp -R 0 /opt \
  && chmod -R g+rwX /opt \
  && chgrp -R 0 /etc \
  && chmod -R g+rwX /etc


RUN chmod 777 /opt/custom-entrypoint.sh
RUN ls -la /opt

ENTRYPOINT ["/opt/custom-entrypoint.sh"]
CMD ["mysqld"]

