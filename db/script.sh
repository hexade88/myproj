SLAVE='mysql -uroot -psuperuser -h127.0.0.1 -P3308'
$SLAVE -e 'SET GLOBAL server_id=2;';
docker restart mysql-slave;