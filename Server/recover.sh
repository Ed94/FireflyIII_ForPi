#!/bin/bash
#
# Original author: Nanne Huiges (nanne@huiges.nl)
# Author(Eds Repo): Edward R. Gonzalez (edwardgz@gmail.com)

# Verbose: Shows commands for debugging.


User="Eds_FireflyPi"
FireflyIII_Directory="/home/$User/Docker/FireflyIII"
ServerDirectory="$FireflyIII_Directory/Server"
SourceDirectory="$FireflyIII_Directory/Source"
BackupDirectory="$ServerDirectory/Backups/latest"
Compose="/usr/local/bin/docker-compose"


if [ "$(ls -A $SourceDirectory)" ]; then
  echo "$SourceDirectory is not empty"
  exit 1
fi

if [ ! -f "$BackupDirectory/backup_db.tar.gz" ]; then
  echo "Missing files from $BackupDirectory"
  exit 1
fi

cd $SourceDirectory

git clone https://github.com/Ed94/FireflyIII_ForPi.git .
git checkout RaspberryPi-3-B+

cp $BackupDirectory/docker-compose.yml $ServerDirectory

# Rebuild.
docker build -t eds/FireflyIII_ForPi:latest .

# This will create the volumes etc.
docker-compose up -d

# Wait a bit, the database needs to be able to start etc.
sleep 25

# We can't start moving (database) files over a running system, can we?
docker-compose down

# Start restoring our backup. In 3 stages because easier debug. You can probably combine these...
$Compose run -v $BackupDirectory:/backups backup \
  tar xzf /backups/backup_db.tar.gz -C /
$Compose run -v $BackupDirectory:/backups backup \
  tar xzf /backups/backup_export.tar.gz -C /
$Compose run -v $BackupDirectory:/backups backup \
  tar xzf /backups/backup_upload.tar.gz -C /
  
# Start the system.
$Compose up -d