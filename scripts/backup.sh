#!/bin/bash

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}"
echo "====================================="
echo "     Linux Backup Automation Tool"
echo "====================================="
echo -e "${NC}"

read -p "Enter folder path to backup: " SOURCE

if [ ! -d "$SOURCE" ]; then
    echo -e "${RED}Error: Folder does not exist!${NC}"
    exit 1
fi

BACKUP_DIR="$HOME/backup"

mkdir -p "$BACKUP_DIR"

DATE=$(date +"%Y-%m-%d_%H-%M-%S")

BACKUP_NAME="backup_$DATE.tar.gz"

tar -czf "$BACKUP_DIR/$BACKUP_NAME" "$SOURCE"

echo ""
echo -e "${GREEN}Backup completed successfully!${NC}"
echo "Backup saved in: $BACKUP_DIR/$BACKUP_NAME"