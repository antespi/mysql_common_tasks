#!/bin/bash

if [ ! $# -eq 1 ]; then echo "Usage: $0 <database>"; exit 1; fi

echo "CREATE DATABASE \`$1\` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;" | mysql
