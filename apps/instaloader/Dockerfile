# syntax=docker/dockerfile:1

FROM python:3.13-alpine3.22
ARG VENDOR
ARG VERSION

ENV \
    PIP_BREAK_SYSTEM_PACKAGES=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1 \
    PIP_NO_CACHE_DIR=1 \
    PIP_ROOT_USER_ACTION=ignore \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

ENV \
    FLASK_RUN_PORT=5633 \
    INSTALOADER_PACKAGE_AUTHOR=${VENDOR} \
    INSTALOADER_PACKAGE_VERSION=${VERSION}

USER root
WORKDIR /app

RUN \
    apk add --no-cache \
        bash \
        ca-certificates \
        catatonit \
        ffmpeg \
        nano \
    && pip install --no-cache-dir instaloader flask gunicorn \
    && mkdir -p /data && chown -R nobody:nogroup /data

COPY . /
RUN chmod +x /entrypoint.sh

USER nobody:nogroup
WORKDIR /data

ENTRYPOINT ["/usr/bin/catatonit", "--", "/entrypoint.sh"]