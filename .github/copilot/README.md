# GitHub Copilot Development Environment Setup

This directory contains configuration files and scripts to set up the OneScript development environment for GitHub Copilot coding agent.

## Files

### Setup Scripts

- **`setup.sh`** - Main setup script that installs OneScript runtime, OVM, and project dependencies
- **`setup-environment.yml`** - GitHub Actions workflow for automated environment setup

### Configuration

- **`config.yml`** - Development environment configuration for Copilot, including:
  - Setup steps and commands
  - Environment variables
  - Available tools and their version commands
  - Project structure information
  - Build and test commands
  - Dependency information

## Usage

The setup script automatically:

1. **Installs system dependencies** - mono-complete, curl, wget
2. **Installs OVM** (OneScript Version Manager) - Downloads and configures ovm.exe
3. **Installs OneScript** - Uses OVM to install the dev version of OneScript
4. **Installs essential packages** - opm, oscript-config
5. **Installs project dependencies** - All runtime and development dependencies from packagedef

## Environment Details

After setup, the following tools are available:

- **`oscript`** - OneScript runtime (version 2.0.0-rc.7+598)
- **`ovm`** - OneScript Version Manager 
- **`opm`** - OneScript Package Manager

All tools are installed under `~/.local/share/ovm/current/bin/` and added to PATH.

## Running Tests

You can run the project tests with:

```bash
oscript tests/ИнтеграционныйТест.os
```

## Dependencies

The environment includes all dependencies specified in `packagedef`:

### Runtime Dependencies
- annotations@1.2.0
- decorator@2.0.2
- reflector@0.7.1

### Development Dependencies  
- 1testrunner@1.9.2
- asserts@1.4.0
- coverage@0.7.0
- fs@1.2.0

## GitHub Documentation Reference

This setup follows the guidelines from [GitHub's documentation for customizing the development environment for Copilot coding agent](https://docs.github.com/en/copilot/customizing-copilot/customizing-the-development-environment-for-copilot-coding-agent).