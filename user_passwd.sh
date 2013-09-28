#!/bin/bash

if [ ! $# -eq 1 ]; then echo "Usage: $0 <username>"; exit 1; fi

USERNAME="$1"
PASSWORD_NEW=
RE_PASSWORD_NEW=
PASSWORD_CURRENT=

exists=`echo "SELECT User FROM mysql.user WHERE User = '$USERNAME';" | mysql`

if [ -z "$exists" ]; then echo "User $USERNAME doesn't exist"; exit 2; fi

read -s -p "Enter root password: " PASSWORD_CURRENT; echo

if ! echo "SHOW DATABASES;" | mysql -u root --password="$PASSWORD_CURRENT" > /dev/null 2>&1 ; then
   echo "Bad password, try again"; exit 2;
fi

read -s -p "Enter new password: " PASSWORD_NEW; echo
read -s -p "Re-enter new password: " RE_PASSWORD_NEW; echo

if [ "$PASSWORD_NEW" != "$RE_PASSWORD_NEW" ]; then
   echo "New passwords are not equal, try again"; exit 3;
fi

echo "USE mysql; UPDATE user SET Password=PASSWORD('$PASSWORD_NEW') where User='$USERNAME'; FLUSH PRIVILEGES;" | mysql -u root --password="$PASSWORD_CURRENT"

if [ "$USERNAME" == "root" ]; then
   echo "NOTE: Remember to update root password in /root/.my.cnf"
fi
