#!/usr/bin/env bash

# Setup script for GitHub Copilot coding agent
# Based on https://docs.github.com/en/copilot/customizing-copilot/customizing-the-development-environment-for-copilot-coding-agent

set -euo pipefail

echo "🚀 Setting up OneScript development environment for Copilot..."

# Install system dependencies
echo "📦 Installing system dependencies..."
sudo apt-get update -qq
sudo apt-get install -y mono-complete curl wget

# Install OVM (OneScript Version Manager)
echo "🔧 Installing OVM (OneScript Version Manager)..."
if [ ! -f /usr/local/bin/ovm.exe ]; then
    sudo wget -q -O /usr/local/bin/ovm.exe https://github.com/oscript-library/ovm/releases/latest/download/ovm.exe
    sudo chmod +x /usr/local/bin/ovm.exe
fi

# Create ovm wrapper
mkdir -p ~/.local/bin
echo 'mono /usr/local/bin/ovm.exe "$@"' > ~/.local/bin/ovm
chmod +x ~/.local/bin/ovm

# Add to PATH
export PATH="$HOME/.local/bin:$PATH"

# Install OneScript
echo "📝 Installing OneScript..."
ovm use --install dev

# Source profile to get environment variables
source ~/.profile 2>/dev/null || true

# Install essential OneScript packages
echo "📚 Installing OneScript packages..."
opm install opm
opm install oscript-config

# Install project dependencies
echo "🔗 Installing project dependencies..."
opm install -l

echo "✅ OneScript development environment setup complete!"
echo "🧪 You can now run tests with: oscript tasks/test.os"