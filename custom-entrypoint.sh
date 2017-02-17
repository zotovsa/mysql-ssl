export MYSQLD_SSL_KEY=/etc/mysql/server.key
export MYSQLD_SSL_CERT=/etc/mysql/server.crt
export MYSQLD_SSL_CA=/etc/mysql/rootCA.crt

echo -e "[mysqld]\n" >/etc/mysql/conf.d/custom.cnf
for var in $(env | grep MYSQLD_ | sed 's/MYSQLD_//'); do
  echo $var | tr '[:upper:]' '[:lower:]' >>/etc/mysql/conf.d/custom.cnf
done

exec /entrypoint.sh $*
