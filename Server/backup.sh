#!/bin/bash
#
# Original author: Nanne Huiges (nanne@huiges.nl)
# Author(Eds Repo): Edward R. Gonzalez (edwardgz@gmail.com)

# Verbose: shows commands for debugging

set -x

User="Eds_FireflyPi"
FireflyIII_Directory="/home/$User/Docker/FireflyIII"
ServerDirectory="$FireflyIII_Directory/Server"
SourceDirectory="$FireflyIII_Directory/Source"
BackupDirectory="$FireflyIII_Directory/Backups"
Compose="/usr/local/bin/docker-compose"
CurrentTime=$(date +"%Y_%m_%d")

mkdir -p $BackupDirectory/$CurrentTime

# working directory
cd $ServerDirectory

# take the system down. We can't copy databasefiles on a running system
sh shutdown.sh

# copy / tar. split in 3 separate commands for easier debugging.
$Compose run -v $BackupDirectory/$CurrentTime:/backups backup \
  tar czvf /backups/backup_db.tar.gz /var/lib/postgresql/data
$Compose run -v $BackupDirectory/$CurrentTime:/backups backup \
  tar czvf /backups/backup_export.tar.gz /var/www/firefly-iii/storage/export
$Compose run -v $BackupDirectory/$CurrentTime:/backups backup \
  tar czvf /backups/backup_upload.tar.gz /var/www/firefly-iii/storage/upload

# copy some stray files. the docker-compose is important as it holds your env. settings!
# for instance your FF_APP_KEY
cp $SourceDirectory/Dockerfile $BackupDirectory/$CurrentTime
cp $ServerDirectory/docker-compose.yml $BackupDirectory/$CurrentTime

sh launch.sh