FROM ubuntu:precise

MAINTAINER João Pedro < jpedro [at] sinfic {dot} pt>

RUN apt-get update
#RUN apt-get upgrade -y

RUN apt-get -y install mysql-server

RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0\nlower_case_table_names = 1/" /etc/mysql/my.cnf

RUN /usr/bin/mysqld_safe & \
    sleep 10s && \
    mysql -e "GRANT ALL ON *.* to 'root'@'%'; FLUSH PRIVILEGES" 

EXPOSE 3306

VOLUME ["/var/lib/mysql", "/var/log/mysql"]

CMD ["mysqld_safe"]
