#!/bin/bash

# Restore Script
# Restore backup from a specified tarball.

BASE_DIR="/home/ab/bu"
BACKUP_DIR="$BASE_DIR/backup"
DATA_DIR="$BASE_DIR/restore"
LOG_FILE="$BASE_DIR/log/restore.log"
BACKUP_FILE=$1

if [[ -z "$BACKUP_FILE" ]]; then
    echo "Usage: $0 <backup_file>"
    exit 1
fi

echo "Starting restore at $(date)"
echo "Starting restore at $(date)" >> "$LOG_FILE"

# Restore the backup
if tar -xzf "$BACKUP_DIR/$BACKUP_FILE" -C "$DATA_DIR"; then
    echo "Restore successful: $BACKUP_FILE"
    echo "Restore successful: $BACKUP_FILE" >> "$LOG_FILE"
else
    echo "Restore failed. Check $LOG_FILE for details."
    echo "Restore failed" >> "$LOG_FILE"
    exit 1
fi

echo "Restore completed at $(date)"
echo "Restore completed at $(date)" >> "$LOG_FILE"

