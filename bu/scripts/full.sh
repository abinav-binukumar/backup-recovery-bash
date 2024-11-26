#!/bin/bash

# Variables
BASE_DIR="$HOME/bu"
BACKUP_SOURCE="$BASE_DIR/data"
BACKUP_DEST="$BASE_DIR/backup"
DATE=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_NAME="full_backup_$DATE.tar.gz"
LOG_FILE="$BASE_DIR/log/full_backup.log"

# Start logging
echo "===================================================" | tee -a "$LOG_FILE"
echo "Starting full backup at $(date)" | tee -a "$LOG_FILE"

# Ensure source directory exists
if [ ! -d "$BACKUP_SOURCE" ]; then
    echo "ERROR: Source directory $BACKUP_SOURCE does not exist!" | tee -a "$LOG_FILE"
    exit 1
fi

# Ensure destination directory exists
if [ ! -d "$BACKUP_DEST" ]; then
    echo "Backup destination $BACKUP_DEST does not exist. Creating it..." | tee -a "$LOG_FILE"
    mkdir -p "$BACKUP_DEST"
    if [ $? -ne 0 ]; then
        echo "ERROR: Failed to create backup destination $BACKUP_DEST" | tee -a "$LOG_FILE"
        exit 1
    fi
fi

# Start the backup process
echo "Creating a full backup of $BACKUP_SOURCE..." | tee -a "$LOG_FILE"
tar -czf "$BACKUP_DEST/$BACKUP_NAME" -C "$BACKUP_SOURCE" . 2>>"$LOG_FILE"

# Check if the backup command worked
if [ $? -eq 0 ]; then
    echo "Full backup completed successfully: $BACKUP_DEST/$BACKUP_NAME" | tee -a "$LOG_FILE"
else
    echo "ERROR: Full backup failed. See log for details." | tee -a "$LOG_FILE"
    exit 1
fi

# Finish
echo "Full backup process completed at $(date)" | tee -a "$LOG_FILE"
echo "===================================================" | tee -a "$LOG_FILE"
exit 0
