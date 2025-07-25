#!/bin/bash
echo "🚀 Starting project setup..."

# Step 1: Create virtual environment
if [ ! -d "venv" ]; then
    echo "✅ Creating virtual environment..."
    python -m venv venv
else
    echo "⚡ Virtual environment already exists."
fi

# Step 2: Activate virtual environment (Windows vs Unix)
if [[ "$OS" == "Windows_NT" ]]; then
    echo "⚡ Activating Windows virtual environment..."
    source venv/Scripts/activate
else
    echo "⚡ Activating Unix virtual environment..."
    source venv/bin/activate
fi

# Step 3: Upgrade pip safely
echo "⬆️ Upgrading pip..."
python -m pip install --upgrade pip || echo "⚠️ Pip upgrade failed, continuing..."

# Step 4: Install dependencies
if [ -f "requirements.txt" ]; then
    echo "📦 Installing dependencies..."
    pip install -r requirements.txt
else
    echo "⚠️ requirements.txt not found!"
fi

# Step 5: Install pre-commit hooks
echo "🔧 Installing pre-commit hooks..."
pre-commit install

echo "🎉 Setup complete! You can now start coding."
