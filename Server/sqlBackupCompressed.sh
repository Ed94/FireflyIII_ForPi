#!/bin/bash
#
# Author: Edward R. Gonzalez
#
# WIP.

DB=fireflypi_server_firefly_iii_db_1

docker exec \
	$(DB) \
	pg_dumpall -c -U postgress | \
	gzip > \
	dump_`date +%d-%m-%Y"_"%H_%M_%S`.gz



