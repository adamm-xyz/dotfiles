#!/bin/bash
# unlock-and-mount.sh - keep this in your home directory or ~/bin

DEVICE="/dev/sdb1"  # Adjust as needed
MAPPER_NAME="stick"

# Unlock
sudo cryptsetup luksOpen $DEVICE $MAPPER_NAME

# Mount with udisks2 (works on most modern Linux distros)
udisksctl mount -b /dev/mapper/$MAPPER_NAME

# Find where it mounted and fix permissions
MOUNT_POINT=$(findmnt -rno TARGET /dev/mapper/$MAPPER_NAME)
sudo chown -R $USER:$USER "$MOUNT_POINT"

echo "Mounted at: $MOUNT_POINT"
