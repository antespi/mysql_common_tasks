#!/bin/bash

if [ ! $# -eq 0 ]; then echo "Usage: $0"; exit 1; fi

echo "SELECT DISTINCT User FROM mysql.user;" | mysql | tail -n +2


