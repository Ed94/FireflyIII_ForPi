#!/bin/bash
#
# Original author: Nanne Huiges (nanne@huiges.nl)
# Author(Eds Repo): Edward R. Gonzalez (edwardgz@gmail.com)

# Goes to the Source directory of the Firefly installation directory and builds a fresh docker image.

# verbose: shows commands for debugging
set -x

User="Eds_FireflyPi"
FireflyDirectory="/home/$User/Docker/FireflyIII"
SourceDirectory="$FireflyDirectory/Source"
EntryPoint="$SourceDirectory/.deploy/docker/entrypoint.sh"

chmod +x -R $EntryPoint

cd $SourceDirectory

docker build -t eds/fireflyiii_pi:latest .