#!/bin/bash

NAME=scython
USE_AWS=0

if [ $USE_AWS -eq 1]; then
    ACCOUNT=`aws iam get-user | grep arn:aws | cut -d':' -f6`
    REGION=us-west-2
    REPO_URL=${ACCOUNT}.dkr.ecr.${REGION}.amazonaws.com/${NAME}
    $(aws ecr get-login --region ${REGION})
else
    REPO_URL='cplee/scython'
fi


docker build -t ${NAME} .
docker tag ${NAME}:latest ${REPO_URL}:latest
docker push ${REPO_URL}:latest



