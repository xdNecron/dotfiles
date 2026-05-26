#!/bin/env bash

HELP_MSG="Usage: $(basename $0) [mount|umount]"
MOUNT_DIR=~/Documents/uni-work/jaro26/pb111
REMOTE_DIR=aisa:/home/xeldunia/pb111 

[[ -z "$1" ]] && echo "$HELP_MSG" && exit 1

if [ "$1" = "mount" ]; then
    sshfs -o auto_unmount $REMOTE_DIR $MOUNT_DIR
elif [ "$1" = "umount" ]; then
<<<<<<< HEAD
    fusermount -u $MOUNT_DIR
=======
    fusermount -zu $MOUNT_DIR
>>>>>>> 51d35873132e5313c84e2fdc2986306cd2e85e04
else
    echo "$HELP_MSG"
    exit 1;
fi

exit 0;
