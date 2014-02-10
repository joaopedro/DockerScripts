FROM development.bp.sinfic.pt:5000/tomcat7

MAINTAINER João Pedro < jpedro [at] sinfic {dot} pt>

# Because docker replaces /sbin/init: https://github.com/dotcloud/docker/issues/1024 
#RUN dpkg-divert --local --rename --add /sbin/initctl
#RUN ln -s /bin/true /sbin/initctl

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get -y install mysql-server

RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0\nlower_case_table_names = 1/" /etc/mysql/my.cnf

RUN /usr/bin/mysqld_safe & \
    sleep 10s && \
    mysql -e "GRANT ALL ON *.* to 'root'@'%'; FLUSH PRIVILEGES" 

EXPOSE 3306

#VOLUME ["/var/lib/mysql", "/var/log/mysql"]

#RUN echo "service tomcat7 start" >> /etc/bash.bashrc
#RUN echo "mysqld_safe" >> /etc/bash.bashrc

RUN mkdir /opt/bin

RUN echo "service tomcat7 start" > /opt/bin/start_services.sh
RUN echo "mysqld_safe" >> /opt/bin/start_services.sh
RUN chmod +x /opt/bin/start_services.sh

CMD /opt/bin/start_services.sh
#ENTRYPOINT /opt/bin/start_services.sh
