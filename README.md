# myproj
Проектная работа

Проект разбит на микросервисы в контейнерах docker, каждая папка это отдельный образ контейнера
с файлами конфигураций, который вы можете настроить при необходимости, либо оставьте настройки по дефолту.


Для успешного запуска проектной работы необходимо выполнить ряд пунктов!

1.  Необходимо предванительно установить и настроить Linux CentOS 7
     #установить docker
          sudo yum install docker
     #запуск сервиса docker
          systemctl enable --now docker
     #установите git   
          yum install git
     #Останавливаем файервол
          systemctl stop firewalld   
     #Выключаем файервол
          systemctl disable firewalld  
     #перезапускаем докер
          systemctl restart docker  
     #Отключаем selinux
          setenforce 0   
     #перезапуск сервера.
          reboot                          

2.  git clone https://github.com/hexade88/myproj.git  #Клонировать репозиторий из сервиса github

     На данном этапе
     Настоятельно рекомендую, в конфиг файлах проекта, изменить пароли к серверам и сервисам
     
     2.1 # Установка репозитория Oracle MySQL 8.0
          rpm -Uvh https://repo.mysql.com/mysql80-community-release-el7-7.noarch.rpm
     2.2 # Устанавливаем клиента mysql
          yum install mysql

3.   #Далее выполняем комманды создания образов и запуск контейнеров   
     # запускаем 2 экземпляра mysql
     docker build -t slave_obj ./db
     docker run --name mysql-slave -p 3308:3306 -e MYSQL_ROOT_PASSWORD=superuser -d slave_obj
     docker run --name mysql-master -p 3306:3306 -e MYSQL_ROOT_PASSWORD=superuser -d mysql:8.0

4.   #Создание образа nginx   
          docker build -t nginx_obj ./nginx    
     #Запуск контейнера
          docker run -d --name nginx -p 80:80 -v /var/log/nginx:/var/log/nginx nginx_obj               

5.   #Создание образа apach
          docker build -t httpd_obj ./httpd                                     
     #Запускаем контейнер
          docker run -d --name httpd -p 8080:8080 httpd_obj        

     #Запуск скрипта рерликации             
     chmod a+rwx ./db/repl.sh
     bash ./db/repl.sh

     #Устанавливаем запуск backup посуточно
     cp ./backup.sh /etc/cron.daily/backup.sh

6.   #Необходимо предварительно перенести rpm пакеты в каталог ELK нашего проекта
     elasticsearch_7.17.3_x86_64-224190-9bcb26.rpm
     filebeat_7.17.3_x86_64-224190-4c3205.rpm
     kibana_7.17.3_x86_64-224190-b13e53.rpm
     logstash_7.17.3_x86_64-224190-3a605f.rpm

7.   ELK установка     
     переходим в каталог ELK
     yum -y install java-openjdk-devel java-openjdk
     rpm -i *.rpm
     
     cp jvm.options /etc/elasticsearch/jvm.options.d/jvm.options

     systemctl enable --now elasticsearch.service

     cp kibana.yml /etc/kibana/kibana.yml
     sudo systemctl enable --now kibana

     cp logstash.yml /etc/logstash/logstash.yml
     cp logstash-nginx-es.conf /etc/logstash/conf.d/logstash-nginx-es.conf
     systemctl restart logstash.service

     cp filebeat.yml /etc/filebeat/filebeat.yml
     systemctl enable filebeat
     systemctl restart filebeat

     Создаём графики на Elastic
     http://localhost:5601

8.   Grafana + Prometheus + node_exporter
     
     bash ./prometheus/ps.sh 
     
     docker run -d --name prometheus -p 9090:9090 -v /prometheus/prometheus.yml:/etc/prometheus/prometheus.yml prom/prometheus