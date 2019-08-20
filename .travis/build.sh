#!/bin/bash

set -e; # exit on first error


if [[ $TRAVIS_BRANCH = "develop"  ]]
then
  mvn -B clean deploy
elif [[ $TRAVIS_BRANCH = "master" ]]
then
  if [[ -n $TRAVIS_TAG  ]]
  then
    mvn -B clean deploy
  else
    mvn -B clean install
  fi
fi


cp target/${PROJECT_ARTIFACT_ID}-${PROJECT_VERSION}.jar src/docker/app.jar

docker build \
  -t dregistry.devops.moovapps.com/visiativ/process/${PROJECT_ARTIFACT_ID}:${PROJECT_VERSION} \
  src/docker/

docker push dregistry.devops.moovapps.com/visiativ/process/${PROJECT_ARTIFACT_ID}:${PROJECT_VERSION}