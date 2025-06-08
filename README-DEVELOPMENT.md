# Development Environment Setup

This document describes how to set up a development environment for this OneScript project.

## Prerequisites

- Ubuntu/Debian Linux system
- Internet access for downloading dependencies

## Quick Setup

Run the setup script to configure your environment:

```bash
./setup-environment.sh
```

This script will:
1. Install Mono runtime (required for OneScript)
2. Download and install ovm (OneScript Version Manager)
3. Install OneScript dev version
4. Install opm and project dependencies

## Manual Setup

If the automated script fails, you can set up the environment manually:

### 1. Install Mono

```bash
sudo apt update
sudo apt install mono-runtime -y
```

### 2. Install OVM (OneScript Version Manager)

```bash
# Create local bin directory
mkdir -p ~/.local/bin

# Download ovm
sudo curl -L https://github.com/oscript-library/ovm/releases/latest/download/ovm.exe -o /usr/local/bin/ovm.exe
sudo chmod +x /usr/local/bin/ovm.exe

# Create wrapper script
echo 'mono /usr/local/bin/ovm.exe "$@"' > ~/.local/bin/ovm
chmod +x ~/.local/bin/ovm

# Add to PATH
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
export PATH="$HOME/.local/bin:$PATH"
```

### 3. Install OneScript

```bash
# Install OneScript development version
ovm use --install dev

# Or install stable version if dev fails
ovm use --install 1.9.0
```

### 4. Install Dependencies

```bash
# Install essential packages
opm install opm
opm install oscript-config

# Install project dependencies
opm install -l
```

## Running Tests

Once the environment is set up, you can run tests:

```bash
# Run validator tests
oscript tests/ВалидаторРеализации.os

# Run integration tests  
oscript tests/ИнтеграционныйТест.os

# Run all tests using the test runner
oscript tasks/test.os
```

## Common Issues

1. **Network connection issues**: If downloads fail, check your firewall settings and internet connection
2. **Permission issues**: Make sure you have sudo access for system-wide installations
3. **PATH issues**: Make sure ~/.local/bin is in your PATH after adding the wrapper script

## Development Container

For a consistent development environment, this project includes devcontainer configuration. If you have Docker and VS Code with Remote-Containers extension:

1. Open the project in VS Code
2. Press Ctrl+Shift+P and run "Remote-Containers: Reopen in Container"
3. The container will automatically set up the OneScript environment