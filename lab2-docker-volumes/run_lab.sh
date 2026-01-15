#!/bin/bash
# Lab 2: Docker Volumes & Persistence
# Author: Burim Shala

echo "Starting Docker Volumes & Persistence Lab..."

# Create data directory if it does not exist
mkdir -p data

# Create initial file
echo "Hello Docker Volumes!" > data/message.txt

# Run Nginx container with volume mount
docker run -d \
  --name lab2-nginx \
  -p 8080:80 \
  -v $(pwd)/data:/usr/share/nginx/html \
  nginx:alpine

echo ""
echo "Lab is running!"
echo "Access the file via browser or curl:"
echo "👉 http://localhost:8080/message.txt"


