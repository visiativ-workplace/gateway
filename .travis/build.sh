#!/bin/bash

source $(dirname $0)/maven-informations.sh

echo "*********************************"
echo "project.artifactId : ${PROJECT_ARTIFACT_ID}"
echo "project.version : ${PROJECT_VERSION}"
echo "*********************************"

mvn -B clean install


echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin dregistry.devops.moovapps.com


cp target/${PROJECT_ARTIFACT_ID}-${PROJECT_VERSION}.jar src/docker/app.jar
docker build \
  -t dregistry.devops.moovapps.com/visiativ/process/${PROJECT_ARTIFACT_ID}:${PROJECT_VERSION} \
  src/docker/

docker tag \
  dregistry.devops.moovapps.com/visiativ/process/${PROJECT_ARTIFACT_ID}:${PROJECT_VERSION} \
  dregistry.devops.moovapps.com/visiativ/process/${PROJECT_ARTIFACT_ID}:nightly

docker push dregistry.devops.moovapps.com/visiativ/process/${PROJECT_ARTIFACT_ID}:${PROJECT_VERSION}