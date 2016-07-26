# Overview
This repo provides a base docker image containing python dependencies.

# Create the Docker Repo
`aws cloudformation create-stack --stack-name scython-repo --template-body file://cfn/ecr.template`

# Publishing the Docker Image
`./publish`