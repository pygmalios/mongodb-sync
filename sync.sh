#!/bin/bash

mkdir -p bak

echo "Backing up $MONGO_DATABASE"
mongodump -h $MONGO_ORIGIN_HOST -d $MONGO_DATABASE -u $MONGO_ORIGIN_USER -p $MONGO_ORIGIN_PASSWORD -o mongodb_backup

echo "Uploading backup"
mongorestore --drop $MONGO_DESTINATION_HOST -d $MONGO_DATABASE -u $MONGO_DESTINATION_USER -p $MONGO_DESTINATION_PASSWORD db_backup/$MONGO_DATABASE

echo "Removing local backup"
rm -rf mongodb_backup
