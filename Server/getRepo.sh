#!/bin/bash
#
# Author: Edward R. Gonzalez
#
# Gets the firefly 3 repository and checks out the pi branch.

git init .
git remote add origin https://github.com/Ed94/FireflyIII_ForPi.git
git fetch --all
git reset --hard origin/RaspberryPi-3-B+
git checkout -t -f RaspberryPi-3-B+
git checkout RaspberryPi-3-B+