#!/bin/bash

if ! [ -f backup-cron ]
then
  echo "Creating cron entry to start backup at: $BACKUP_TIME"
  cat <<-EOF >> backup-cron
DB_HOST=$DB_HOST
DB_NAME=$DB_NAME
DB_USER=$DB_USER
DB_PASS=$DB_PASS
MEDIA_ROOT=$MEDIA_ROOT
EOF

  if [[ $CLEANUP_OLDER_THAN ]]
  then
    echo "CLEANUP_OLDER_THAN=$CLEANUP_OLDER_THAN" >> backup-cron
  fi
  echo "$BACKUP_TIME backup > /backup.log" >> backup-cron

  crontab backup-cron
fi

echo "Current crontab:"
crontab -l

exec "$@"
