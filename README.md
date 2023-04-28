# myproj
Проектная работа

Проект разбит на микросервисы в контейнерах docker, каждая папка это отдельный образ контейнера
с файлами конфигураций, который вы можете настроить при необходимости, либо оставьте настройки по дефолту.

Для успешного запуска проектной работы необходимо выполнить ряд пунктов!

1.  Необходимо предванительно установить Linux CentOS 7
    sudo yum install docker         #установить docker
    systemctl enable --now docker   #запуск сервиса docker
    yum install git                 #установите git    
    reboot   #перезапуск сервера.

2.  mkdir proj; cd proj;  #Создайте каталог и войдите в енего

3.  git clone https://github.com/hexade88/myproj.git  # Скачайте репозиторий из сервиса github

4.   #Далее выполняем комманды создания образов и запуск контейнеров

5.   cd ./myproj/nginx                              #Заходим в каталог nginx 
     docker build -t nginx_obj .                    #Создание образа nginx
     docker run -d --name nginx -p 80:80 nginx_obj  #Запуск контейнера

6.   cd /root/proj/myproj/httpd/                    #Заходим в каталог Apache
     docker build -t httpd_obj .
     docker run -d --name httpd -p 8080:80 -p 8081:81 httpd_obj