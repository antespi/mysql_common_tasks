#!/bin/bash

if [ ! $# -eq 2 ]; then echo "Usage: $0 <username> <password>"; exit 1; fi

echo "CREATE USER '$1'@'localhost' IDENTIFIED BY  '$2';" | mysql || exit $?
echo "GRANT USAGE ON * . * TO  '$1'@'localhost' IDENTIFIED BY  '$2' WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0 ;" | mysql

