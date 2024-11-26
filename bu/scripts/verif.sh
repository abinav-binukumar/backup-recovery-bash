#!/bin/bash

# Backup Verification Script
# Verify the integrity of a backup tarball.

BASE_DIR="/home/ab/bu"
BACKUP_DIR="$BASE_DIR/backup"
LOG_FILE="$BASE_DIR/log/verify.log"
BACKUP_FILE=$1

if [[ -z "$BACKUP_FILE" ]]; then
    echo "Usage: $0 <backup_file>"
    exit 1
fi

echo "Starting verification of $BACKUP_FILE at $(date)"
echo "Starting verification of $BACKUP_FILE at $(date)" >> "$LOG_FILE"

# Verify the backup tarball
if tar -tzf "$BACKUP_DIR/$BACKUP_FILE" > /dev/null; then
    echo "Backup verified successfully: $BACKUP_FILE"
    echo "Backup verified successfully: $BACKUP_FILE" >> "$LOG_FILE"
else
    echo "Backup verification failed: $BACKUP_FILE. Check $LOG_FILE for details."
    echo "Backup verification failed: $BACKUP_FILE" >> "$LOG_FILE"
    exit 1
fi

echo "Verification completed at $(date)"
echo "Verification completed at $(date)" >> "$LOG_FILE"

