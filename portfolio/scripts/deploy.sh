#!/bin/bash

echo "***********************************"
echo "Navigate to the docker folder"
echo "***********************************"
cd /home/ubuntu/web-app/Web-Portfolio-test/portfolio/docker 

echo "***********************************"
echo "Login to AWS ECR"
echo "***********************************"
aws ecr get-login-password --region <region> | docker login --username AWS --password-stdin <account_id>.dkr.ecr.<region>.amazonaws.com

echo "***********************************"
echo "Stop the application"
echo "***********************************"
docker compose down

echo "***********************************"
echo "Remove all dangling and unused docker images"
echo "***********************************"
docker image prune -af

echo "***********************************"
echo "Pull latest images from repository"
echo "***********************************"
docker compose pull

echo "***********************************"
echo "Start the application"
echo "***********************************"
docker compose up -d

echo "***********************************"
echo "Application deployment completed successfully!"
echo "***********************************"
EOF
