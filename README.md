# mongodb-sync
Docker image to sync MongoDB databases


## Origin MongoDB requirements

### URI definition

```
MONGO_ORIGIN_URI
```

### Hosname definition

```
MONGO_ORIGIN_HOST
MONGO_ORIGIN_USER
MONGO_ORIGIN_PASSWORD
MONGO_DATABASE
```

## Destination MongoDB requirements

### URI definition

#### Required env variables

```
MONGO_DESTINATION_URI
MONGO_DATABASE
```

### Hostname definition

#### Required env variables

```
MONGO_DESTINATION_HOST
MONGO_DESTINATION_USER
MONGO_DESTINATION_PASSWORD
MONGO_DATABASE
```

#### Optional env variables

```
MONGO_DESTINATION_AUTH_DB
```

## Examples

```
MONGO_ORIGIN_URI="mongodb://pyg-directory-backup:REDACTED@ds055983-a0.mongolab.com:55983,ds055983-a1.mongolab.com:55983/pyg-directory?replicaSet=rs-ds055983&readPreference=nearest&retryWrites=false" MONGO_DATABASE=pyg-directory MONGO_DESTINATION_URI=mongodb+srv://pyg-directory-development:REDACTED@pyg-directory-development-z4zfh.gcp.mongodb.net/pyg-directory ./sync.sh
```

```
MONGO_ORIGIN_HOST=ds055983-a0.mongolab.com:55983 MONGO_ORIGIN_PASSWORD=REDACTED MONGO_ORIGIN_USER=pyg-directory-backup MONGO_DATABASE=pyg-directory MONGO_DESTINATION_URI=mongodb+srv://pyg-directory-development:REDACTED@pyg-directory-development-z4zfh.gcp.mongodb.net/pyg-directory ./sync.sh
```

```
MONGO_ORIGIN_HOST=ds055983-a0.mongolab.com:55983 MONGO_ORIGIN_PASSWORD=REDACTED MONGO_ORIGIN_USER=pyg-directory-backup MONGO_DATABASE=pyg-directory MONGO_DESTINATION_HOST=ds219620-a0.mlab.com:19620,ds219620-a1.mlab.com:19620 MONGO_DESTINATION_USER=pyg-directory-development MONGO_DESTINATION_PASSWORD=REDACTED ./sync.sh
```
