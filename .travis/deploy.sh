#!/bin/bash

docker push dregistry.devops.moovapps.com/visiativ/process/${PROJECT_ARTIFACT_ID}:${PROJECT_VERSION}
docker push dregistry.devops.moovapps.com/visiativ/process/${PROJECT_ARTIFACT_ID}:$1