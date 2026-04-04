# Internet Archive CLI - Docker

![Docker](https://img.shields.io/badge/docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)
![Python](https://img.shields.io/badge/python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Internet Archive](https://img.shields.io/badge/Internet_Archive-666666?style=for-the-badge&logo=internetarchive&logoColor=white)
![License](https://img.shields.io/badge/license-MIT-green?style=for-the-badge)

Download items from Archive.org using a containerized environment.

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

## Notes

Downloads are saved to `./downloads/` in the project directory.
