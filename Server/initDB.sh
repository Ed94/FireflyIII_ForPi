#!/bin/bash
#
#
# Initializes the docker database for firefly.

set -x 

docker-compose exec -T firefly_iii_app php artisan firefly:upgrade-database
docker-compose exec -T firefly_iii_app php artisan firefly:verify
docker-compose exec -T firefly_iii_app php artisan passport:install
docker-compose exec -T firefly_iii_app php artisan cache:clear