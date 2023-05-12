MYSQL='mysql -uroot -psuperuser -h127.0.0.1 -P3306'
$MYSQL -e "CREATE USER repl@'%' IDENTIFIED WITH 'caching_sha2_password' BY 'superuser';";
$MYSQL -e "GRANT REPLICATION SLAVE ON *.* TO repl@'%';";

rezult=$($MYSQL -N -e "SHOW MASTER STATUS;";)
read binlog position <<< $rezult
echo $binlog
echo $position

$MYSQL -e "SELECT @@server_id;";