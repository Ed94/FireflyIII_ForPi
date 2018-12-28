#!/bin/bash
#
# Author: Edward R. Gonzalez
#
# WIP

DB=fireflypi_server_firefly_iii_db_1
set -x

docker-compose exec -u firefly_db postgres  pg_dumpall -Fc firefly_iii_db > dump_`date +%d_%m-%Y"_"%H_%M_%S`.dump

