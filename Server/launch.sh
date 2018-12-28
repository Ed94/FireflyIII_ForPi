#!/bin/bash
#
# Author: Edward R. Gonzalez
#
# Starts the firefly server.

set -x

User="Eds_FireflyPi"
FireflyDirectory="/home/$User/Docker/FireflyIII"
SourceDirectory="$FireflyDirectory/Source"
EntryPoint="$SourceDirectory/.deploy/docker/entrypoint.sh"

chmod +x -R $EntryPoint

docker-compose up -d