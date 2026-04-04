FROM python:3-slim

RUN pip install --no-cache-dir internetarchive

WORKDIR /downloads

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
