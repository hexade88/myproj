MYSQL='mysql -uroot -psuperuser'
$MYSQL -e "CREATE USER repl@'%' IDENTIFIED WITH 'caching_sha2_password' BY 'superuser';";
$MYSQL -e "GRANT REPLICATION SLAVE ON *.* TO repl@'%';";
$MYSQL -e "SHOW MASTER STATUS;";
$MYSQL -e "SELECT @@server_id;";