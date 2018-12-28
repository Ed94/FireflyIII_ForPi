#!/bin/bash
#
# Original author: Nanne Huiges (nanne@huiges.nl)
# Author(Eds Repo): Edward R. Gonzalez (edwardgz@gmail.com)

# Verbose: Shows commands for debugging.
set -x

User="Eds_FireflyPi"
FireflyIII_Directory="/home/$User/Docker/FireflyIII"
ServerDirectory="$FireflyIII_Directory/Server"
SourceDirectory="$FireflyIII_Directory/Source"
BackupDirectory="$FireflyIII_Directory/Backups/latest"
Compose="/usr/local/bin/docker-compose"

if [ ! -f "$BackupDirectory/backup_db.tar.gz" ]; then
  echo "Missing files from $BackupDirectory"
  exit 1
fi

cd $FireflyIII_Directory

git init .
git remote add origin https://github.com/Ed94/FireflyIII_ForPi.git
git fetch --all
git reset --hard origin/RaspberryPi-3-B+
git checkout -t -f RaspberryPi-3-B+
git checkout RaspberryPi-3-B+

cp $BackupDirectory/Dockerfile $SourceDirectory
cp $BackupDirectory/docker-compose.yml $ServerDirectory

cd $ServerDirectory

# Rebuild.
sh ./build.sh

# This will create the volumes etc.
sh ./launch.sh

# Wait a bit, the database needs to be able to start etc.
sleep 25

# We can't start moving (database) files over a running system, can we?
sh ./shutdown.sh

# Start restoring our backup. In 3 stages because easier debug. You can probably combine these...
$Compose run -v $BackupDirectory:/backups backup \
  tar xzf /backups/backup_db.tar.gz -C /
$Compose run -v $BackupDirectory:/backups backup \
  tar xzf /backups/backup_export.tar.gz -C /
$Compose run -v $BackupDirectory:/backups backup \
  tar xzf /backups/backup_upload.tar.gz -C /
  
# Start the system.
sh ./launch.sh