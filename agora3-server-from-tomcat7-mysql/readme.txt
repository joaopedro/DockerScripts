docker build -t development.bp.sinfic.pt:5000/agora3-server .

#With Prompt, Start services in /opt/bin/start_services.sh tomcat logs at /var/lib/tomcat7/logs
docker run -t -i -p 3316:3306 -p 8080:8080 -lxc-conf="lxc.network.hwaddr=00:21:6a:81:17:d6" development.bp.sinfic.pt:5000/agora3-server /bin/bash

#With mysql port (3316) exposed
docker run -d -p 3316:3306 -p 8080:8080 -lxc-conf="lxc.network.hwaddr=00:21:6a:81:17:d6" development.bp.sinfic.pt:5000/agora3-server

#RUN
docker run -d -p 8080:8080 -lxc-conf="lxc.network.hwaddr=00:21:6a:81:17:d6" -name agora3-server development.bp.sinfic.pt:5000/agora3-server
