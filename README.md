# DevContainer for Python Development

This repository provides a development container setup for Python projects, designed to work on a host with Docker already configured. The setup ensures a consistent development environment, making it easier to manage dependencies and tools.

## Getting Started

1. **Clone the repository**:
    ```sh
    git clone <repository-url>
    cd <repository-directory>
    ```

2. **Open the repository in VS Code**:
    Ensure you have the Remote - Containers extension installed.

3. **Reopen in Container**:
    Open the Command Palette (`Ctrl+Shift+P`), and select `Remote-Containers: Reopen in Container`.

## Repository Structure and Configuration

### `./requirements.txt`
This file lists the Python dependencies required for the project. It ensures that all necessary packages are installed in the container environment.

### `./helpers/list_files.sh`
A bash script to list all files in a specified directory and its subdirectories, excluding hidden directories. This can be useful for quickly inspecting the contents of a project.

### `./.devcontainer/dockerfile`
Defines the Docker image for the development container:
- **Base Image**: `python:3.12-slim-bookworm`
- **Installed Packages**: Includes essential build tools, Docker, and Python packages.
- **Working Directory**: Sets `/app` as the working directory.
- **Dependency Installation**: Installs Python dependencies from `requirements.txt`.

### `./.devcontainer/devcontainer.json`
Configuration file for the development container:
- **Name**: Specifies the container name as "Python 3".
- **Context and Dockerfile**: Points to the Dockerfile and context.
- **Mounts**: Binds the Docker socket to allow Docker commands within the container.
- **Remote Environment**: Sets the Docker host.
- **Post Create Command**: Adds an alias for AWS CLI using Docker.
- **Run Arguments**: Configures network settings.
- **Customizations**: Installs useful VS Code extensions for Python development.

### `./.vscode/settings.json`
VS Code settings for the project:
- **Formatting**: Enables format on save and sets default formatters for various file types.
- **Python Analysis**: Configures the Python language server and type checking mode.

### `./.vscode/launch.json`
Debug configuration for VS Code:
- **Python: Launch as Module**: Allows launching Python files as modules using the Command Variable extension.

## Useful Links

- Remote - Containers Extension
- Python Docker Image
- VS Code Python Extension

Feel free to explore and modify the setup to fit your development needs!