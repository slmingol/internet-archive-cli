# Internet Archive CLI - Docker

![Docker](https://img.shields.io/badge/docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)
![Python](https://img.shields.io/badge/python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Internet Archive](https://img.shields.io/badge/Internet_Archive-666666?style=for-the-badge&logo=internetarchive&logoColor=white)
![License](https://img.shields.io/badge/license-MIT-green?style=for-the-badge)

Download items from Archive.org using a containerized environment.

## Quick Start

Pull the pre-built image from GitHub Container Registry:

podman pull ghcr.io/slmingol/internet-archive-cli:latest
podman run -it --rm -v ./downloads:/downloads ghcr.io/slmingol/internet-archive-cli:latest

Or build locally with Docker Compose:

podman compose build
podman compose run --rm ia-downloader

## Usage

### Interactive Mode (Prompts for Item ID)
```bash
podman compose run --rm ia-downloader
```

### Direct Download with Item ID
```bash
podman compose run --rm ia-downloader download 4613CS
```

### Use Any IA Command
```bash
# Search
podman compose run --rm ia-downloader search "subject:computer science"

# List files without downloading
podman compose run --rm ia-downloader list 4613CS

# Download specific file
podman compose run --rm ia-downloader download 4613CS --glob="*.pdf"
```

## Files

- `Dockerfile` - Python container with internetarchive CLI
- `docker-compose.yml` - Container orchestration
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
