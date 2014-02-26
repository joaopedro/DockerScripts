docker build -t development.bp.sinfic.pt:5000/owncloud .

docker run -d -p=443:443 development.bp.sinfic.pt:5000/owncloud

http://dischord.org/blog/2013/08/13/docker-and-owncloud-part-2/
https://github.com/yankcrime/dockerfiles/tree/master/owncloud/resources
