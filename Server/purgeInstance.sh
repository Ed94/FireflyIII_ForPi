#!/bin/bash
#
# WIP.
# Purges the current containers and volumes for firefly running on docker.
# WARNING: WILL DELETE ALL DATA (FROM DATABSE).

set -x 

docker-compose down

docker ps

docker container prune

docker volume prune