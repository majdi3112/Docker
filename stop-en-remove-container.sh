#!/bin/bash


CONTAINER_NAME="demo-container"

docker stop ${CONTAINER_NAME}

docker rm ${CONTAINER_NAME} 
