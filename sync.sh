#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

mkdir -p mongodb_backup

echo "Backing up $MONGO_DATABASE"
if [ ! -z ${MONGO_ORIGIN_URI:-} ]; then
  mongodump --uri="$MONGO_ORIGIN_URI" -o mongodb_backup
else
  mongodump -h "$MONGO_ORIGIN_HOST" -d "$MONGO_DATABASE" -u "$MONGO_ORIGIN_USER" -p "$MONGO_ORIGIN_PASSWORD" -o mongodb_backup
fi;

echo "Uploading backup"
if [ ! -z ${MONGO_DESTINATION_URI:-} ]; then
  mongorestore --drop --uri="$MONGO_DESTINATION_URI" -d "$MONGO_DATABASE" "mongodb_backup/$MONGO_DATABASE"
elif [ ! -z ${MONGO_DESTINATION_AUTH_DB:-} ]; then
  mongorestore --drop -h "$MONGO_DESTINATION_HOST" -d "$MONGO_DATABASE" -u "$MONGO_DESTINATION_USER" -p "$MONGO_DESTINATION_PASSWORD" "mongodb_backup/$MONGO_DATABASE" --authenticationDatabase "$MONGO_DESTINATION_AUTH_DB"
else
  mongorestore --drop -h "$MONGO_DESTINATION_HOST" -d "$MONGO_DATABASE" -u "$MONGO_DESTINATION_USER" -p "$MONGO_DESTINATION_PASSWORD" "mongodb_backup/$MONGO_DATABASE"
fi;

echo "Removing local backup"
rm -rf mongodb_backup

