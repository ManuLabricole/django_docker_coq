#!/bin/bash

echo "🛑 Stopping the database container..."

# Function to stop and remove a Docker container by name
stop_and_remove_container() {
  CONTAINER_NAME=$1
  if [ "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
    echo "🔍 Container $CONTAINER_NAME is running. Attempting to stop and remove it."
    docker stop $CONTAINER_NAME
    docker rm $CONTAINER_NAME
    echo "✅ Container $CONTAINER_NAME has been stopped and removed."
  else
    echo "✅ Container $CONTAINER_NAME is not running."
  fi
}

# Stop and remove the database container
stop_and_remove_container db-dev
