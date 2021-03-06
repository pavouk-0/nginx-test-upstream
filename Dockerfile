#===============================================================================
# FROMFREEZE docker.io/library/nginx:latest
FROM docker.io/library/nginx@sha256:1c70a669bbf07f9862f269162d776c35144b116938d1becb4e4676270cff8f75
#-------------------------------------------------------------------------------
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        curl && \
    rm -rf /var/lib/apt/lists/*
#-------------------------------------------------------------------------------
COPY src/ /etc/nginx/
#-------------------------------------------------------------------------------
HEALTHCHECK CMD curl -fs localhost:80 || false
#===============================================================================
