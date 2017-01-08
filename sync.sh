#!/bin/bash

mkdir -p mongodb_backup

echo "Backing up $MONGO_DATABASE"
mongodump -h "$MONGO_ORIGIN_HOST" -d "$MONGO_DATABASE" -u "$MONGO_ORIGIN_USER" -p "$MONGO_ORIGIN_PASSWORD" -o mongodb_backup

echo "Uploading backup"
mongorestore --drop -h "$MONGO_DESTINATION_HOST" -d "$MONGO_DATABASE" -u "$MONGO_DESTINATION_USER" -p "$MONGO_DESTINATION_PASSWORD" "mongodb_backup/$MONGO_DATABASE" --authenticationDatabase "$MONGO_DESTINATION_AUTH_DB"

echo "Removing local backup"
rm -rf mongodb_backup
