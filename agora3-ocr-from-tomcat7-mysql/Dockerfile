FROM development.bp.sinfic.pt:5000/tomcat7-mysql

MAINTAINER João Pedro < jpedro [at] sinfic {dot} pt>

RUN echo export CATALINA_OPTS=\"-Xmx256M -XX:MaxPermSize=128M -Djava.awt.headless=true\" >  /usr/share/tomcat7/bin/setenv.sh

RUN apt-get install -y wget language-pack-en
RUN apt-get install -y wget language-pack-pt
RUN locale-gen pt_PT
RUN locale-gen pt_PT.utf8
RUN locale-gen pt_PT@euro
ADD data/webapp/ /var/lib/tomcat7/webapps/ROOT/

ADD data/tomcat-libs /usr/share/tomcat7/lib
ADD data/bin /opt/bin/
ADD data/tesseract-ocr-por /opt/tesseract-ocr-por
ADD data/tesseract-ocr-eng /opt/tesseract-ocr-eng

RUN apt-get -y install libpng-dev libjpeg-dev libtiff-dev zlib1g-dev
RUN apt-get -y install gcc g++
RUN apt-get -y install autoconf automake libtool checkinstall

RUN cd /opt && wget http://www.leptonica.org/source/leptonica-1.69.tar.gz && tar -zxvf leptonica-1.69.tar.gz
RUN cd /opt/leptonica-1.69 && ./configure && make && checkinstall && ldconfig
RUN cd /opt && rm leptonica-1.69.tar.gz && rm -r leptonica-1.69

RUN cd /opt && wget https://tesseract-ocr.googlecode.com/files/tesseract-ocr-3.02.02.tar.gz && tar -zxvf tesseract-ocr-3.02.02.tar.gz
RUN cd /opt/tesseract-ocr && ./autogen.sh && ./configure && make && make && make install && ldconfig
RUN cd /opt && rm tesseract-ocr-3.02.02.tar.gz && rm -r tesseract-ocr

RUN cp -r /opt/tesseract-ocr-por/tessdata /usr/local/share
RUN cp -r /opt/tesseract-ocr-eng/tessdata /usr/local/share

RUN mkdir -p /opt/agora-ocr/ocr_upload
ADD data/default_images /opt/agora-ocr/ocr_upload
RUN chown -R tomcat7:tomcat7 /opt/agora-ocr

ADD data/database/schema.sql /opt/schema.sql
RUN /usr/bin/mysqld_safe &\
    sleep 10s && \
    /usr/bin/mysql < /opt/schema.sql
RUN rm /opt/schema.sql

RUN chmod +x /opt/bin/install-java-io.sh
RUN /opt/bin/install-java-io.sh /usr/lib/jvm/java-7-oracle

RUN echo "/opt/bin/link_agora.sh" > /opt/bin/start_services_linked.sh
RUN echo "/opt/bin/start_services.sh" >> /opt/bin/start_services_linked.sh
RUN chmod +x /opt/bin/start_services_linked.sh

CMD /opt/bin/start_services_linked.sh
#ENTRYPOINT /opt/bin/start_services.sh
