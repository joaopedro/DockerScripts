FROM development.bp.sinfic.pt:5000/agora3-ocr:m1

MAINTAINER João Pedro < jpedro@sinfic.pt>

RUN rm /opt/agora-ocr/ocr_upload/*
ADD data/default_images /opt/agora-ocr/ocr_upload

RUN chown -R tomcat7:tomcat7 /opt/agora-ocr

RUN rm -R /var/lib/tomcat7/webapps/ROOT/*
ADD data/webapp/ /var/lib/tomcat7/webapps/ROOT/

ADD data/database/schema.sql /opt/schema.sql
ADD data/database/drop.sql /opt/drop.sql
RUN /usr/bin/mysqld_safe &\
    sleep 10s && \
    /usr/bin/mysql < /opt/drop.sql && \
    /usr/bin/mysql < /opt/schema.sql

RUN rm /opt/schema.sql
RUN rm /opt/drop.sql

CMD /opt/bin/start_services_linked.sh
#ENTRYPOINT /opt/bin/start_services.sh
