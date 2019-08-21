#!/usr/bin/env bash

source .travis/maven-informations.sh

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin dregistry.devops.moovapps.com


docker push dregistry.devops.moovapps.com/visiativ/process/${PROJECT_ARTIFACT_ID}:${PROJECT_VERSION}
docker push dregistry.devops.moovapps.com/visiativ/process/${PROJECT_ARTIFACT_ID}:$1