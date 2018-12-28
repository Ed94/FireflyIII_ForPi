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
rm ./docker-compose.yml
rm ./docker-compose_default.yml
rm ./fixPermissions.sh
rm ./initDB.sh
rm ./purgeInstance.sh
rm ./readme.md
rm ./sqlBackup.sh
rm ./sqlBackupCompressed.sh
rm ./update.sh
rm ./wipe.sh