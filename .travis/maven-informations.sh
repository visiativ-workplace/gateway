#!/bin/bash

export PROJECT_ARTIFACT_ID=$(mvn org.apache.maven.plugins:maven-help-plugin:3.1.0:evaluate -Dexpression=project.artifactId -q -DforceStdout)
export PROJECT_VERSION=$(mvn org.apache.maven.plugins:maven-help-plugin:3.1.0:evaluate -Dexpression=project.version -q -DforceStdout)

echo "*********************************"
echo "project.artifactId : ${PROJECT_ARTIFACT_ID}"
echo "project.version : ${PROJECT_VERSION}"
echo "*********************************"
