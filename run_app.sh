#!/bin/sh
docker rm discovery -f
docker rm config -f
docker rm gateway -f

NETWORK_NAME=goalapp
if [ -z $(docker network ls --filter name=^${NETWORK_NAME}$ --format="{{ .Name }}") ] ; then
     docker network create ${NETWORK_NAME} ;
fi

docker container run -d --name discovery --network=goalapp -p 8761:8761 discovery:latest
sleep 20
docker container run -d --name config --network=goalapp -p 8888:8888 config:latest
sleep 20
docker container run -d --name gateway --network=goalapp -p 9099:9099 gateway:latest