#!/usr/bin/env bash

set -eux

echo "Setting up OneScript development environment..."

# Check if mono is installed
if ! command -v mono &> /dev/null; then
    echo "Installing mono..."
    sudo apt update
    sudo apt install mono-runtime -y
fi

# Create bin directory for ovm wrapper
echo "Setting up ovm (OneScript Version Manager)..."
mkdir -p ~/.local/bin

# Download and install ovm if not present
if [ ! -f /usr/local/bin/ovm.exe ]; then
    echo "Downloading ovm..."
    sudo curl -L https://github.com/oscript-library/ovm/releases/latest/download/ovm.exe -o /usr/local/bin/ovm.exe
    sudo chmod +x /usr/local/bin/ovm.exe
fi

# Create ovm wrapper script
echo "Creating ovm wrapper..."
echo 'mono /usr/local/bin/ovm.exe "$@"' > ~/.local/bin/ovm
chmod +x ~/.local/bin/ovm

# Add to PATH if not already there
if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
    export PATH="$HOME/.local/bin:$PATH"
fi

echo "Installing OneScript dev version..."
ovm use --install dev || {
    echo "Failed to install OneScript dev version. Trying stable version..."
    ovm use --install 1.9.0 || {
        echo "Failed to install OneScript. Please check your network connection and try again."
        exit 1
    }
}

# Source profile to get environment variables
source ~/.profile || true

echo "Installing essential packages..."
opm install opm || echo "Warning: Failed to install opm package"
opm install oscript-config || echo "Warning: Failed to install oscript-config"

echo "Installing project dependencies..."
cd "$(dirname "$0")"
opm install -l || echo "Warning: Failed to install local dependencies"

echo "Setup completed successfully!"
echo "You can now run tests with: oscript tests/ВалидаторРеализации.os"