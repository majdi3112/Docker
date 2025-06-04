#!/bin/bash

# Container naam
CONTAINER_NAME="demo-container"

# Stop de container
docker stop ${CONTAINER_NAME}

# Verwijder de container
docker rm ${CONTAINER_NAME} 