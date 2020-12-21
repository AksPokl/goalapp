#!/bin/sh
docker rm config -f

NETWORK_NAME=goalapp
if [ -z $(docker network ls --filter name=^${NETWORK_NAME}$ --format="{{ .Name }}") ] ; then
     docker network create ${NETWORK_NAME} ;
fi

docker container run -d --name config --network=goalapp -p 8888:8888 config:latest