FROM development.bp.sinfic.pt:5000/tomcat7-mysql

MAINTAINER João Pedro < jpedro [at] sinfic {dot} pt>

RUN echo export CATALINA_OPTS=\"-Xmx256M -XX:MaxPermSize=128M -Djava.awt.headless=true\" >  /usr/share/tomcat7/bin/setenv.sh

RUN mkdir /opt/agora
RUN chown tomcat7:tomcat7 /opt/agora
ADD data/license.xml /opt/agora/license.xml

ADD data/webapp/ /var/lib/tomcat7/webapps/ROOT/
RUN chown -R tomcat7:tomcat7  /var/lib/tomcat7/webapps/ROOT/
ADD data/tomcat-libs /usr/share/tomcat7/lib

ADD data/database/schema.sql /opt/schema.sql
RUN /usr/bin/mysqld_safe &\
    sleep 10s && \
    /usr/bin/mysql < /opt/schema.sql
RUN rm /opt/schema.sql

CMD /opt/bin/start_services.sh
#ENTRYPOINT /opt/bin/start_services.sh
