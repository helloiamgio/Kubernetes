#!/bin/bash

DUMP_FILE_NAME="backupOn`date +%Y-%m-%d-%H-%M`.dump"
echo "Creating dump: $DUMP_FILE_NAME"

cd pg_backup

pg_dump -C -w --format=c --blobs > $DUMP_FILE_NAME

if [ $? -ne 0 ]; then
  rm $DUMP_FILE_NAME
  echo "Backup not created, check db connection settings"
  exit 1
fi

echo "Current backups:"
ls -la

echo 'Successfully Backed Up'
exit 0
