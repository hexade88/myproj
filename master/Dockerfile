FROM mysql:8.0
COPY ./script.sh /docker-entrypoint-initdb.d/script.sh
RUN chmod a+rwx /docker-entrypoint-initdb.d/script.sh
EXPOSE 3306
CMD bash /docker-entrypoint-initdb.d/script.sh