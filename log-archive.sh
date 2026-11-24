#!/bin/bash

if [ $# -ne 1 ]
then
    echo "Usage: $0 <log-directory>"
    exit 1
fi

LOG_DIR=$1

if [ ! -d "$LOG_DIR" ]
then
    echo "Directory not found"
    exit 1
fi

ARCHIVE_DIR="archives"

mkdir -p "$ARCHIVE_DIR"

TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

ARCHIVE_NAME="logs_archive_${TIMESTAMP}.tar.gz"

tar -czf "$ARCHIVE_DIR/$ARCHIVE_NAME" "$LOG_DIR"

if [ $? -eq 0 ]
then
    echo "Archive created successfully"

    echo "$(date) : Archived $LOG_DIR into $ARCHIVE_DIR/$ARCHIVE_NAME" >> archive.log
else
    echo "Archive failed"
    exit 1
fi
