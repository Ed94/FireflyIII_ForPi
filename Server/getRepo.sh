#!/bin/bash
#
# Author: Edward R. Gonzalez
#
# Gets the firefly 3 repository and checks out the pi branch.

set -x

User="Eds_FireflyPi"
FireflyIII_Directory="/home/$User/Docker/FireflyIII"

cd $FireflyIII_Directory

git init .
git remote add origin https://github.com/Ed94/FireflyIII_ForPi.git
git fetch --all
git reset --hard origin/RaspberryPi-3-B+
git checkout -t -f -b RaspberryPi-3-B+