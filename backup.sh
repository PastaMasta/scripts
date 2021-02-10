#! /bin/bash

# Backs up /data/ to external drive mount

backup_mount="/data-backup"

echo "Backup /data to ${backup_mount} ?"
read

if ! mount | grep -q "on ${backup_mount}" ; then
  echo "Nothing mounted on backup_mount!"
  echo "Are you sure?"
  read
  echo "Realllllly ?"
  read
fi

rsync -a -v --delete --stats --exclude-from ~/backup.exclude  /data ${backup_mount}/$(uname -n)/ | tee -a /var/log/backup-$(date --iso-8601).log

touch ${backup_mount}/$(uname -n)/backup-completed-$(date --iso-8601=m)
