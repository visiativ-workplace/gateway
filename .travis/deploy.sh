#!/usr/bin/env bash

rm ~/.docker/config.json

echo "start docker login"
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin dregistry.devops.moovapps.com
echo "end docker login"
cat ~/.docker/config.json
echo "end docker login"

docker push dregistry.devops.moovapps.com/visiativ/process/${PROJECT_ARTIFACT_ID}:${PROJECT_VERSION}
docker push dregistry.devops.moovapps.com/visiativ/process/${PROJECT_ARTIFACT_ID}:$1