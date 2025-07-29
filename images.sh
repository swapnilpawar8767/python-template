#!/bin/bash

echo "🛠️ Docker Image Pull Script"

# Check if Docker is installed or not 
if ! command -v docker &> /dev/null; then
  echo "❌ Docker is not installed. Please install Docker to continue."
  exit 1
fi

# Check if Docker is running or not 
if ! docker info &> /dev/null; then
  echo "❌ Docker is not running. Please start Docker Desktop or the Docker daemon."
  exit 1
fi

# Menu
echo "Select the images you want to pull (separated by spaces):"
echo "1) hello-world"
echo "2) httpd"
echo "3) nginx"
echo "4) mariadb"
echo "5) alpine"
echo "6) python"
read -p "Enter your choices (e.g., 1 3 4): " choices

# Map and process
for choice in $choices; do
  case $choice in
    1) image="hello-world" ;;
    2) image="httpd" ;;
    3) image="nginx" ;;
    4) image="mariadb" ;;
    5) image="alpine" ;;
    6) image="python" ;;
    *) 
      echo "⚠️ Invalid option: $choice (skipped)"
      continue
      ;;
  esac

  # Check if image is already present
  if docker image inspect "$image" &> /dev/null; then
    echo "✅ Image '$image' already exists locally. Skipping pull."
  else
    echo "📥 Pulling image: $image"
    docker pull $image
  fi
done

echo "✅ Done pulling selected images."
