#!/bin/bash

## Backup a folder to a remote address using borg.
## Usage: backup-borg.sh
## To restore: borg extract $BORG_REPO::computer-and-date

set -eu
export BORG_REPO='/run/media/aaditya/AADI-DATA/LinuxHomeBackups'
export BORG_PASSPHRASE='Chesswiz2437'

/usr/bin/borg create ::{hostname}-{now} /home
/usr/bin/borg prune --keep-weekly=4 --keep-monthly=6
