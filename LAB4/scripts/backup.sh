#!/bin/bash

TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_DIR="/backups"
BACKUP_FILE="$BACKUP_DIR/db_backup_$TIMESTAMP.sql"
DB_CONTAINER="mysql"  # Match the service name in docker-compose.yml

# Create backup directory if it doesn't exist
mkdir -p $BACKUP_DIR

# Create database backup
docker exec $DB_CONTAINER mysqldump -u root -pexample app_db > $BACKUP_FILE

echo "Backup completed successfully"