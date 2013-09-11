#!/bin/bash

if [ ! $# -eq 0 ]; then echo "Usage: $0"; exit 1; fi

echo "SHOW DATABASES;" | mysql
