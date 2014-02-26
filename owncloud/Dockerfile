FROM ubuntu:precise
MAINTAINER João Pedro "jpedro@sinfic.pt"
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" >> /etc/apt/sources.list
RUN apt-get -y update

RUN locale-gen en_US en_US.UTF-8
RUN dpkg-reconfigure locales

RUN apt-get install -y apache2 php5 php5-gd php-xml-parser php5-intl php5-sqlite smbclient curl libcurl3 php5-mysql php5-curl bzip2 wget vim openssl ssl-cert sharutils

RUN wget -q -O - http://download.owncloud.org/community/owncloud-6.0.0a.tar.bz2 | tar jx -C /var/www/

RUN mkdir /etc/apache2/ssl

ADD resources/001-owncloud.conf /etc/apache2/sites-available/
ADD resources/start.sh /

RUN a2ensite 001-owncloud.conf
RUN a2enmod rewrite ssl

RUN chown -R www-data:www-data /var/www/owncloud
RUN chmod +x /start.sh

CMD ["/start.sh"]
