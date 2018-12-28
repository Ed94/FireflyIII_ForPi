#!/bin/bash
#
# Original author: Nanne Huiges (nanne@huiges.nl)
# Author(Eds Repo): Edward R. Gonzalez (edwardgz@gmail.com)

# Goes to the Source directory of the Firefly installation directory and builds a fresh docker image.

# verbose: shows commands for debugging
set -x

User="Eds_FireflyPi"
FireflyIII_Directory="/home/$User/Docker/FireflyIII"
SourceDirectory="$FireflyIII_Directory/Source"

cd $SourceDirectory

docker build -t eds/FireflyIII_ForPi:latest .