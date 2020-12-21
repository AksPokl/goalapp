#!/bin/sh
docker rm discovery -f

NETWORK_NAME=goalapp
if [ -z $(docker network ls --filter name=^${NETWORK_NAME}$ --format="{{ .Name }}") ] ; then
     docker network create ${NETWORK_NAME} ;
fi

docker container run -d --name discovery --network=goalapp -p 8761:8761 discovery:latest