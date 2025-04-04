#!/bin/bash

TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_DIR="/backups"
BACKUP_FILE="$BACKUP_DIR/db_backup_$TIMESTAMP.sql"
DB_CONTAINER="LAB4-db-1"  # Updated to match new project name

# Create backup directory if it doesn't exist
mkdir -p $BACKUP_DIR

# Create database backup
docker exec $DB_CONTAINER mysqldump -u user -ppassword api_db > $BACKUP_FILE

# Send email notification
echo "Database backup completed: $BACKUP_FILE" | mail -s "Database Backup Notification" your@email.com

echo "Backup completed and email sent"