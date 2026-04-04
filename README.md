# Internet Archive CLI - Docker

![GitHub release (latest by date)](https://img.shields.io/github/v/release/slmingol/internet-archive-cli?style=for-the-badge&logo=github&color=blue)
![Build Status](https://img.shields.io/github/actions/workflow/status/slmingol/internet-archive-cli/docker-build.yml?style=for-the-badge&logo=github-actions&logoColor=white)
![Docker Image Size](https://img.shields.io/docker/image-size/slmingol/internet-archive-cli/latest?style=for-the-badge&logo=docker&logoColor=white)
![GitHub last commit](https://img.shields.io/github/last-commit/slmingol/internet-archive-cli?style=for-the-badge&logo=git&logoColor=white)

![Docker](https://img.shields.io/badge/docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)
![Python](https://img.shields.io/badge/python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Internet Archive](https://img.shields.io/badge/Internet_Archive-666666?style=for-the-badge&logo=internetarchive&logoColor=white)
![License](https://img.shields.io/badge/license-MIT-green?style=for-the-badge)

Download items from Archive.org using a containerized environment.

## Quick Start

**Using pre-built image with Docker Compose:**

# Podman
podman compose -f docker-compose.run.yml run --rm ia-downloader

# Docker
docker compose -f docker-compose.run.yml run --rm ia-downloader

**Using pre-built image directly:**

# Podman
podman pull ghcr.io/slmingol/internet-archive-cli:latest
podman run -it --rm -v ./downloads:/downloads ghcr.io/slmingol/internet-archive-cli:latest

# Docker
docker pull ghcr.io/slmingol/internet-archive-cli:latest
docker run -it --rm -v ./downloads:/downloads ghcr.io/slmingol/internet-archive-cli:latest

**Build locally:**

# Podman
podman compose build
podman compose run --rm ia-downloader

# Docker
docker compose build
docker compose run --rm ia-downloader

## Usage

### Interactive Mode (Prompts for Item ID)

# Podman
podman compose run --rm ia-downloader

# Docker
docker compose run --rm ia-downloader

### Direct Download with Item ID

# Podman
podman compose run --rm ia-downloader download 4613CS

# Docker
docker compose run --rm ia-downloader download 4613CS

### Use Any IA Command

# Search
podman compose run --rm ia-downloader search "subject:computer science"
docker compose run --rm ia-downloader search "subject:computer science"

# List files without downloading
podman compose run --rm ia-downloader list 4613CS
docker compose run --rm ia-downloader list 4613CS

# Download specific file
podman compose run --rm ia-downloader download 4613CS --glob="*.pdf"
docker compose run --rm ia-downloader download 4613CS --glob="*.pdf"

## Files

- `Dockerfile` - Python container with internetarchive CLI
- `docker-compose.yml` - Build and run locally
- `docker-compose.run.yml` - Run pre-built image from GHCR
- `entrypoint.sh` - Interactive prompt script
- `downloads/` - Downloaded files (created automatically)

## CI/CD

This project uses GitHub Actions for automated version management and Docker image publishing:

### Semantic Versioning

Commits to main trigger automatic version bumps based on commit messages:
- patch bump - Regular commits (1.0.0 → 1.0.1)
- minor bump - Commits with feat: or feature: (1.0.0 → 1.1.0)
- major bump - Commits with BREAKING CHANGE or major: (1.0.0 → 2.0.0)

GitHub releases and git tags are created automatically.

### Container Registry

Docker images are automatically built and published to GitHub Container Registry:
- ghcr.io/slmingol/internet-archive-cli:latest - Latest main branch build
- ghcr.io/slmingol/internet-archive-cli:vX.Y.Z - Semantic version tags
- Multi-architecture support: linux/amd64, linux/arm64

## Notes

Downloads are saved to ./downloads/ in the project directory.
