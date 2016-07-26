#!/bin/bash

NAME=scython
ACCOUNT=`aws iam get-user | grep arn:aws | cut -d':' -f6`
REGION=us-west-2

$(aws ecr get-login --region ${REGION})
docker build -t ${NAME} .
docker tag ${NAME}:latest ${ACCOUNT}.dkr.ecr.${REGION}.amazonaws.com/${NAME}:latest
docker push ${ACCOUNT}.dkr.ecr.${REGION}.amazonaws.com/${NAME}-python:latest



