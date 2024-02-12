#!/bin/bash

# Retrieve the ECR repository URI and image tag
API_ECR_REPOSITORY_URI=<repo url>
IMAGE_TAG="latest"

# Authenticate Docker with ECR
$(aws ecr get-login --no-include-email --region ap-south-1)


# Pull the Docker image from ECR
docker pull "${API_ECR_REPOSITORY_URI}:${IMAGE_TAG}"

#Run the docker-compose
ls -l
pwd
cd /home/ec2-user/app

docker run -d -name fastapico01 -p 80:8080 "${API_ECR_REPOSITORY_URI}:${IMAGE_TAG}"

