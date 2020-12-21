#!/bin/sh
docker rm gateway -f

NETWORK_NAME=goalapp
if [ -z $(docker network ls --filter name=^${NETWORK_NAME}$ --format="{{ .Name }}") ] ; then
     docker network create ${NETWORK_NAME} ;
fi

docker container run -d --name gateway --network=goalapp -p 9099:9099 gateway:latest