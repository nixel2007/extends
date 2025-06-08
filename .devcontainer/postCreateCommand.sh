#!/usr/bin/env bash

set -eux

# Create bin directory for ovm wrapper
mkdir -p /home/vscode/.local/bin

# Create ovm wrapper script to use with mono
echo "mono /usr/local/bin/ovm.exe \"\$@\"" > /home/vscode/.local/bin/ovm
chmod +x /home/vscode/.local/bin/ovm

# Install OneScript dev version
ovm use --install dev

# Source profile to get environment variables
source /home/vscode/.profile

# Install essential packages
opm install opm
opm install oscript-config

# Install project dependencies
opm install -l