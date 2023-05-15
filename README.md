# myproj
Проектная работа

Проект разбит на микросервисы в контейнерах docker, каждая папка это отдельный образ контейнера
с файлами конфигураций, который вы можете настроить при необходимости, либо оставьте настройки по дефолту.
Настоятельно рекомендую изменить пароли к серверам mysql

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
     
     2.1 # Установка репозитория Oracle MySQL 8.0
          rpm -Uvh https://repo.mysql.com/mysql80-community-release-el7-7.noarch.rpm
     2.2 # Устанавливаем клиента mysql
          yum install mysql

3.   #Далее выполняем комманды создания образов и запуск контейнеров   
     # запускаем 2 экземпляра mysql
     docker run --name mysql-master -p 3306:3306 -e MYSQL_ROOT_PASSWORD=superuser -d mysql:8.0
     docker run --name mysql-slave -p 3308:3306 -e MYSQL_ROOT_PASSWORD=superuser -d mysql:8.0

4.   docker build -t nginx_obj ./nginx                                            #Создание образа nginx
     docker run -d -v logs:/var/log --name nginx -p 80:80 nginx_obj               #Запуск контейнера

5.   docker build -t httpd_obj ./httpd                                     #Создание образа apach
     docker run -d --name httpd -p 8080:8080 httpd_obj                     #Запускаем контейнер


     chmod a+rwx ./db/repl.sh
     bash ./db/repl.sql