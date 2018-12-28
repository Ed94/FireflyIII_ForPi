#!/bin/bash
#
# Original author: Nanne Huiges (nanne@huiges.nl)
# Author(Eds Repo): Edward R. Gonzalez (edwardgz@gmail.com)

#Goes to the Source directory of the Firefly installation directory and updates the image and server container.

# Verbose: Shows commands for debugging
set -x

# todo
# backup ?https://github.com/NanneHuiges/firefly-iii/tree/raspi

User="Eds_FireflyPi"
FireflyIII_Directory="/home/$User/Docker/FireflyIII"
SourceDirectory="$FireflyIII_Directory/Source"

cd $SourceDirectory

# Update code
git checkout master
git merge upstream/master
git checkout raspi
git merge master

# Build the container
sh ./build.sh

# Restart and recreate the image.
docker-compose up -d --force-recreate

# Run isntall stuff
docker-compose exec -T firefly_iii_app php artisan migrate
docker-compose exec -T firefly_iii_app php artisan firefly:upgrade-database
docker-compose exec -T firefly_iii_app php artisan firefly:verify
docker-compose exec -T firefly_iii_app php artisan passport:install
docker-compose exec -T firefly_iii_app php artisan cache:clear

docker-compose exec -T firefly_iii_app chown -R www-data:www-data \
  -R /var/www/firefly-iii/storage/export \
  -R /var/www/firefly-iii/storage/upload \
  -R /var/www/firefly-iii/storage/logs \
  -R /var/www/firefly-iii/storage/framework/cache