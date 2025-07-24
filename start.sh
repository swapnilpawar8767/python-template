#!/bin/bash
set -e

echo "🚀 Starting project setup..."

# Create virtual environment if not exists
if [ ! -d "venv" ]; then
    python -m venv venv
    echo "✅ Virtual environment created."
fi

# Detect OS and activate virtual environment
if [[ "$OS" == "Windows_NT" ]]; then
    echo "⚡ Activating Windows virtual environment..."
    source venv/Scripts/activate
else
    echo "⚡ Activating Linux/Mac virtual environment..."
    source venv/bin/activate
fi

# Upgrade pip
pip install --upgrade pip

# Install dependencies
pip install -r requirements.txt

# Setup pre-commit hooks
pre-commit install

echo "🎉 Setup complete! You can now start coding."
