set -x 

docker-compose down

docker ps

docker container prune

docker volume prune