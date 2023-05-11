MYSQL='mysql -uroot -psuperuser'
$MYSQL -e "RENAME USER 'root'@'localhost' TO 'root'@'%';";