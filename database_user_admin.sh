#!/bin/bash

if [ ! $# -eq 2 ]; then echo "Usage: $0 <username> <database>"; exit 1; fi

echo "GRANT ALL PRIVILEGES ON  \`$2\` . * TO  '$1'@'localhost' WITH GRANT OPTION ; FLUSH PRIVILEGES;" | mysql

