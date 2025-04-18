#!/bin/bash
cat << EOF > /etc/mysql/database_init.sql
CREATE DATABASE IF NOT EXISTS $db_name;
CREATE USER IF NOT EXISTS '$db_user'@'%' IDENTIFIED BY '$db_user_pass';
GRANT ALL PRIVILEGES ON *.* TO '$db_user'@'%';
FLUSH PRIVILEGES;
EOF
