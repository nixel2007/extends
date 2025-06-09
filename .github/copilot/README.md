# GitHub Copilot Development Environment Setup

This directory contains configuration files to set up the OneScript development environment for GitHub Copilot coding agent.

## Files

### Configuration

- **`copilot-setup-steps.yml`** - GitHub Actions workflow that sets up the OneScript development environment, including:
  - OneScript runtime installation via `otymko/setup-onescript@v1.5`
  - Version detection from packagedef
  - OPM dependency installation
  - Project dependencies setup

## Usage

The workflow automatically:

1. **Checks out the repository** - Uses `actions/checkout@v4`
2. **Detects OneScript version** - Extracts version from packagedef or uses "stable" as default
3. **Installs OneScript** - Uses `otymko/setup-onescript@v1.5` action
4. **Installs dependencies** - Runs `opm install opm` and `opm install -l --dev`

## Environment Details

After setup, the following tools are available:

- **`oscript`** - OneScript runtime 
- **`ovm`** - OneScript Version Manager 
- **`opm`** - OneScript Package Manager

## Running Tests

You can run the project tests with:

```bash
oscript tasks/test.os
```

## Running Tests with Code Coverage

You can run tests with code coverage collection:

```bash
oscript tasks/coverage.os
```

This will generate coverage reports in multiple formats:
- `coverage.xml` - Cobertura format
- `genericCoverage.xml` - Generic coverage format  
- `stat.json` - Coverage statistics in JSON format

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