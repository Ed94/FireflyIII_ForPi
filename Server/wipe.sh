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

rm -vf ! ("recovery.sh")