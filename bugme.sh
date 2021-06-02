#!/bin/bash

# stop containers in case you forgot to do so
docker-compose down

# start both crdbs, v20.2.10 and v21.1.1
docker-compose up -d

# Load sample databases on both
docker-compose exec -T cockroach20 cockroach sql --insecure < schema.sql
docker-compose exec -T cockroach21 cockroach sql --insecure < schema.sql

# Issue queries just after loading
printf "\nIssuing sample queries...\n"
printf "\nCockroachDB v20.2.10:\n\n"
docker-compose exec -T cockroach20 cockroach sql --insecure < bug.sql
printf "\nCockroachDB v21.1.1:\n\n"
docker-compose exec -T cockroach21 cockroach sql --insecure < bug.sql
printf "\nBoth cockroach versions return a single row, this is OK.\n"

# Wait one minute
printf "\nWaiting a minute...\n"
sleep 1m

# Issue queries again
printf "\nIssuing sample queries again...\n"
printf "\nCockroachDB v20.10.2:\n\n"
docker-compose exec -T cockroach20 cockroach sql --insecure < bug.sql
printf "\nCockroachDB v21.1.1:\n\n"
docker-compose exec -T cockroach21 cockroach sql --insecure < bug.sql
printf "\nMagic, the v21.1.1 row is now gone!\n"

# Related to the possible bug?
printf "\nIf we use LIMIT2, the row gone appears again!\n\n"
docker-compose exec -T cockroach21 cockroach sql --insecure < bug.1.sql