docker build -t development.bp.sinfic.pt:5000/agora3-ocr .

#With Prompt, Start services in /opt/bin/start_services.sh tomcat logs at /var/lib/tomcat7/logs
docker run -t -i -p 3316:3306 -p 8090:8080 development.bp.sinfic.pt:5000/agora3-ocr /bin/bash

#With mysql port (3316) exposed
docker run -d -p 3316:3306 -p 8090:8080 development.bp.sinfic.pt:5000/agora3-ocr

#RUN StandAlone
docker run -d -p 8090:8080 -name agora3-ocr development.bp.sinfic.pt:5000/agora3-ocr

#RUN Linked
docker run -d -link agora3-server:agora3_server -p 8090:8080 -name agora3-ocr development.bp.sinfic.pt:5000/agora3-ocr
