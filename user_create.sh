#!/bin/bash

if [ ! $# -eq 1 ]; then echo "Usage: $0 <username>"; exit 1; fi

USERNAME="$1"
PASSWORD=
RE_PASSWORD=

exists=`echo "SELECT User FROM mysql.user WHERE User = '$USERNAME';" | mysql`

if [ -n "$exists" ]; then echo "User $USERNAME already exists"; exit 2; fi

read -s -p "Enter password: " PASSWORD; echo
read -s -p "Re-enter password: " RE_PASSWORD; echo

if [ "$PASSWORD" != "$RE_PASSWORD" ]; then
   echo "New passwords are not equal, try again"; exit 3;
fi

echo "CREATE USER '$USERNAME'@'localhost' IDENTIFIED BY  '$PASSWORD';" | mysql || exit $?
echo "GRANT USAGE ON * . * TO  '$USERNAME'@'localhost' IDENTIFIED BY  '$PASSWORD' WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0 ;" | mysql

