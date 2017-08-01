#!/bin/sh

MYSQLLOGFILE="/var/log/mysqld.log"
DEFAULT_PASSWORD="$(grep "temporary password" "${MYSQLLOGFILE}" | awk -F"root@localhost: " '{print $2}')"
PASSWORD=$(grep 'password' /root/.my.cnf | awk -F"password=" '{print $2}')

mysqladmin -p"${DEFAULT_PASSWORD}" password "${PASSWORD}"
mysql_secure_installation -p"${PASSWORD}" -D
