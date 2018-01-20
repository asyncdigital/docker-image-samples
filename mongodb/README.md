# Mongodb Container

## Install mongo container image
```
# Install latest
docker pull mongo

# Or install version 3.6

docker pull mongo:3.6
```

## Run caointer
### mongodb は指定しない場合は、mongoはポート27017でmongodインスタンスに接続:  use 30001 instead of 27017
Suppose you want to run mongo conatiner named 'my-mongo' exposing port 30001 instead of 27017:
```
docker run --rm -p 30001:27017 -d --name my-mongo mongo
```
If you don't specify port #,  mongo start with port # 27017

## Connect mongodb  ('test' database)
Suppose you have mongo client command on your local machine, connect like this:
```
mongo 127.0.0.1:30001/test
```
In case that you don't have mongo command local, connect mongo using mongo client in mongo container that you've run
```
docker run -it --link my-mongo:mongo --rm mongo sh -c 'exec echo "$MONGO_PORT_27017_TCP_ADDR:$MONGO_PORT_27017_TCP_PORT/test"'
```
**MONGO_PORT_27017_TCP_ADDR:$MONGO_PORT_27017_TCP_PORT** are environment variables that Docker automatically generates

# Go inside the conatiner
```
docker exec -it my-mongo bash
```


## LINKS
- https://docs.mongodb.com
- https://hub.docker.com/_/mongo/
