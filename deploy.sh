#!/bin/bash

# Load environment variables from .env
set -a
source .env
set +a

echo "🔐 Logging into GitHub Container Registry..."
echo $GHCR_TOKEN | docker login ghcr.io -u $GHCR_USERNAME --password-stdin

echo "⬇️ Pulling image: ghcr.io/$GHCR_USERNAME/$IMAGE_NAME:latest"
docker pull ghcr.io/$GHCR_USERNAME/$IMAGE_NAME:latest

echo "🧹 Stopping any existing containers..."
docker compose down

echo "🚀 Starting container using docker-compose..."
docker compose up -d

echo "✅ Deployment complete."
