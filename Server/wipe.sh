#!bin/bash
#
# Author: Edward R. Gonzalez
#
# Used to do a clean wipe of a firefly 3 installation with the exception of the Backups and Server directory scripts for recovery.

User="Eds_FireflyPi"
FireflyDirectory="/home/$User/Docker/FireflyIII"
ServerDirectory="$FireflyDirectory/Server"
SourceDirectory="$FireflyDirectory/Source"

sh ./purgeInstance.sh

# Firefly directory removals
rm -rf $FireflyDirectory/.git
rm -rf $FireflyDirectory/FireflyManager
rm -rf $FireflyDirectory/Source
rm -f $FireflyDirectory/.gitignore


# Server directory removals
cd $ServerDirectory

rm ./backup.sh
rm ./build.sh
rm ./docker-compose.yml
rm ./fixPermissions.sh
rm ./initDB.sh
rm ./launch.sh
rm ./purgeInstance.sh
rm ./readme.md
rm ./shutdown.sh
rm ./sqlBakcup.sh
rm ./sqlBackupCompressed.sh
rm ./update.sh
rm ./wipe.sh

# All that should be left is recovery.sh and getRepo.sh inside the server directory of FireflyIII.