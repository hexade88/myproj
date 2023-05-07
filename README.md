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

4.   docker build -t nginx_obj ./myproj/nginx                                     #Создание образа nginx
     docker run -d -v logs:/var/log --name nginx -p 80:80 nginx_obj               #Запуск контейнера

5.   docker build -t httpd_obj ./myproj/httpd                                     #Создание образа apach
     docker run -d -v logs:/var/log --name httpd -p 8080:8080 httpd_obj           #Запускаем контейнер