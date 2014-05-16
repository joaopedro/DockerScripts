docker build -t development.bp.sinfic.pt:5000/owncloud .

docker run -d -p 443:443 -v /home/jpedro/owncloud-data:/var/www/owncloud/data -name owncloud development.bp.sinfic.pt:5000/owncloud

http://dischord.org/blog/2013/08/13/docker-and-owncloud-part-2/
https://github.com/yankcrime/dockerfiles/tree/master/owncloud/resources


ldap.sinfic.pt
CN=pegasus,CN=Users,DC=sinfic,DC=pt
Xp%$35qf

adminAgoraStorage