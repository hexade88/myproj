FROM httpd:2.4.57
RUN mkdir /var/log/apache2/ && chmod a+rwx /var/log/apache2/
COPY ./httpd.conf /usr/local/apache2/conf/httpd.conf
COPY ./index1.html /usr/local/apache2/htdocs/index.html