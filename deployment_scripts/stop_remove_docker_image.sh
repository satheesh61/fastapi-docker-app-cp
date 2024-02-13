#|/bin/bash


# # Authenticate Docker with ECR
# $(aws ecr get-login --no-include-email --region ap-south-1)
API_ECR_REPOSITORY_URI=<repo url>
# stop the docker compose
cd /home/ec2-user/app
ls

# docker stop $(docker ps -q) 2>/dev/null
# docker rm $(docker ps -a -q) 2>/dev/null
# docker rmi $(docker images --filter dangling=true -q) 2>/dev/null
# docker ps -aq | xargs docker stop | xargs docker rm
# docker rmi ${docker images | grep "${API_ECR_REPOSITORY_URI}" }

# Get a list of running container IDs
running_containers=$(docker ps -aq)

# Check if any containers are running
if [[ -n "$running_containers" ]]; then
    # Stop each running container
    for container_id in $running_containers; do
        docker stop "$container_id"
    done

    # Remove stopped containers
    docker rm $running_containers

    image_ids=$(docker images -aq "${API_ECR_REPOSITORY_URI}")
    # Delete corresponding images
    for image_id in $image_ids; do      
        docker rmi "$image_id"
    done

    echo "Stopped, removed containers, and deleted images."
else
    echo "No running Docker containers found."
fi
