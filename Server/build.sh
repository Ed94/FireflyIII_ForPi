#!/bin/bash
#
# original author: Nanne Huiges (nanne@huiges.nl)
# author(Eds Repo): Edward R. Gonzalez (edwardgz@gmail.com)

# Goes to the Source directory of the Firefly installation directory and builds a fresh docker image.

# verbose: shows commands for debugging
set -x

UserName="Eds_FireflyPi"
SourceDirectory="/home/$UserName/Docker/FireflyIII_Server"

cd $SourceDirectory

docker build -t eds/FireflyIII_ForPi:latest .