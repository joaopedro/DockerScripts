FROM    ubuntu:precise
MAINTAINER João Pedro <jpedro@sinfic.pt>

RUN    sed -i 's/main/main universe/' /etc/apt/sources.list
RUN    echo 'deb http://download.opensuse.org/repositories/isv:ownCloud:community/xUbuntu_12.04/ /' >> /etc/apt/sources.list.d/owncloud.list
RUN    apt-get --force-yes -y install curl
RUN    curl http://download.opensuse.org/repositories/isv:/ownCloud:/community/xUbuntu_12.04/Release.key | apt-key add -
RUN    apt-get update && apt-get -y install owncloud language-pack-en-base language-pack-pt-base
RUN    apt-get -y install php5-ldap
ENV     APACHE_RUN_USER www-data
ENV     APACHE_RUN_GROUP www-data
ENV     APACHE_LOG_DIR /var/log/apache2

RUN mkdir /etc/apache2/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/apache2/ssl/server.key -out /etc/apache2/ssl/server.crt -batch -subj "/C=PT/ST=Portugal/O=sinfic/localityName=lisbon/commonName=sinfic.pt/organizationalUnitName=bp/emailAddress=bp@sinfic.pt/"

ADD resources/001-owncloud.conf /etc/apache2/sites-available/
RUN a2ensite 001-owncloud.conf
RUN a2enmod rewrite ssl

VOLUME ["/var/www/owncloud/data"]

#RUN     echo "127.0.0.1     localhost" >> /etc/hosts
RUN     echo "<? header('Location: /owncloud/'); ?>" > /var/www/index.php
RUN	sed -i s/^\ *upload_max_filesize.*/upload_max_filesize\ =\ 500\ MB\;/ /etc/php5/apache2/php.ini
RUN	sed -i s/^\ *post_max_filesize.*/post_max_filesize\ =\ 600\ MB\;/ /etc/php5/apache2/php.ini
RUN	sed -i s/^\ *max_execution_time.*/max_execution_time\ =\ 300\;/ /etc/php5/apache2/php.ini
RUN	sed -i s/^\ *max_input_time.*/max_input_time\ =\ 500\;/ /etc/php5/apache2/php.ini
EXPOSE  80
CMD service apache2 start && tail -f /var/log/apache2/error.log
