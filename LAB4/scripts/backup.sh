#!/bin/bash

# Variables
DB_CONTAINER="lab4-db-1"

# Create backup directory if it doesn't exist
mkdir -p ./backups

# Perform MySQL database backup
docker exec $DB_CONTAINER mysqldump -u user -ppassword api_db > ./backups/db_backup_$(date +"%Y%m%d_%H%M%S").sql

# Check if the backup was successful
if [ $? -eq 0 ]; then
    echo "Backup completed successfully: ./backups/db_backup_$(date +"%Y%m%d_%H%M%S").sql"
else
    echo "Backup failed!"
    exit 1
fi