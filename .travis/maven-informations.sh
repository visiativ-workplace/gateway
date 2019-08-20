#!/bin/bash

echo -ne '                     (00%)\r'
export PROJECT_ARTIFACT_ID=$(mvn org.apache.maven.plugins:maven-help-plugin:3.1.0:evaluate -Dexpression=project.artifactId -q -DforceStdout)
echo -ne '###########             (50%)\r'
export PROJECT_VERSION=$(mvn org.apache.maven.plugins:maven-help-plugin:3.1.0:evaluate -Dexpression=project.version -q -DforceStdout)
echo -ne '#######################   (100%)\r'
echo -ne '\n'

echo "*********************************"
echo "project.artifactId : ${PROJECT_ARTIFACT_ID}"
echo "project.version : ${PROJECT_VERSION}"
echo "*********************************"
