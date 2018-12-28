#!/bin/bash
#
# NOTE: Not sure if needed.
# Helps force some permissions for FTP and whatnot.

set -x 


sudo docker-compose exec -T firefly_iii_app chown -R www-data:www-data \
	-R /var/www/firefly-iii/storage/export \
	-R /var/www/firefly-iii/storage/upload \
	-R /var/www/firefly-iii/storage/logs \
	-R /var/www/firefly-iii/storage/logs \
	-R /var/www/firefly-iii/storage/framework/cache

docker-compose exec -T firefly_iii_app chown -R www-data:www-data -R /var/www/firefly-iii/storage
docker-compose exec -T firefly_iii_app chmod -R 775 /var/www/firefly-iii/storage



