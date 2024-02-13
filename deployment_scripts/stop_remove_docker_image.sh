#|/bin/bash


# # Authenticate Docker with ECR
# $(aws ecr get-login --no-include-email --region ap-south-1)
API_ECR_REPOSITORY_URI=<repo url>
# stop the docker compose
cd /home/ec2-user/app
ls

docker stop $(docker ps -q) 2>/dev/null
docker rm $(docker ps -a -q) 2>/dev/null
docker rmi $(docker images --filter dangling=true -q) 2>/dev/null
# docker ps -aq | xargs docker stop | xargs docker rm
# docker rmi ${docker images | grep "${API_ECR_REPOSITORY_URI}" }
