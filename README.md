# myproj
Проектная работа

Проект разбит на микросервисы в контейнерах docker, каждая папка это отдельный образ контейнера
с файлами конфигураций, который вы можете настроить при необходимости, либо оставьте настройки по дефолту.

Для успешного запуска проектной работы необходимо выполнить ряд пунктов!

1.  Необходимо предванительно установить и настроить Linux CentOS 7
    sudo yum install docker         #установить docker
    systemctl enable --now docker   #запуск сервиса docker
    yum install git                 #установите git    
    systemctl stop firewalld        #Останавливаем файервол
    systemctl disable firewalld     #Выключаем файервол
    systemctl restart docker        #перезапускаем докер
    setenforce 0                    #Отключаем selinux
    reboot                          #перезапуск сервера.

2.  git clone https://github.com/hexade88/myproj.git  #Клонировать репозиторий из сервиса github

3.   #Далее выполняем комманды создания образов и запуск контейнеров

4.   cd ./myproj/nginx                              #Заходим в каталог nginx 
     docker build -t nginx_obj .                    #Создание образа nginx
     docker run -d --name nginx -p 80:80 nginx_obj  #Запуск контейнера

5.   cd /root/proj/myproj/httpd/                    #Заходим в каталог Apache
     docker build -t httpd_obj .
     docker run -d --name httpd -p 8080:80 -p 8081:81 httpd_obj