#!/bin/env bash

HELP_MSG="Usage: $(basename $0) [mount|umount]"
MOUNT_DIR=~/Documents/uni-work/jaro26/pb111
REMOTE_DIR=aisa:/home/xeldunia/pb111 

[[ -z "$1" ]] && echo "$HELP_MSG" && exit 1

if [ "$1" = "mount" ]; then
    sshfs -o auto_unmount $REMOTE_DIR $MOUNT_DIR
elif [ "$1" = "umount" ]; then
    fusermount -u $MOUNT_DIR
else
    echo "$HELP_MSG"
    exit 1;
fi

exit 0;
