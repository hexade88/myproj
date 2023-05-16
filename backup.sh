#!/bin/bash

# --master-data заменил на --source-data запись бинлога в файле присутствует

if [ -d "$HOME/backup/" ]; then
  rm -rf $HOME/backup/*
fi

MYSQL='mysql -uroot -psuperuser -h127.0.0.1 -P3308'

$MYSQL -e "STOP SLAVE;";
echo $?;    #проверка для себя
for s in `$MYSQL --skip-column-names -e "select distinct(TABLE_SCHEMA) from information_schema.tables where TABLE_SCHEMA not like 'information_schema';"`;
    do
        mkdir $s;
        for table in `$MYSQL --skip-column-names -e "select table_name from information_schema.tables where TABLE_SCHEMA='$s'";`;
                do
                        /usr/bin/mysqldump -uroot -psuperuser -h127.0.0.1 -P3308 --source-data --add-drop-table --add-locks --create-options --disable-keys --extended-insert --single-transaction --quick --set-charset --events --routines --triggers $HOME/backup/$s $table
                done
    done
$MYSQL -e "START SLAVE;";
echo $?;