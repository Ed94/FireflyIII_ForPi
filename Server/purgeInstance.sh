#!/bin/bash
#
# WIP.
# Purges the current containers and volumes for firefly running on docker.
# WARNING: WILL DELETE ALL DATA (FROM DATABSE).

set -x

User="Eds_FireflyPi"
FireflyIII_Directory="/home/$User/Docker/FireflyIII"

cd $FireflyIII_Directory/Server

ls

./shutdown.sh

docker ps

docker container prune

docker volume prune