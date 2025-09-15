#!/usr/bin/env bash

exec \
    env PYTHONPATH=/ \
    /usr/local/bin/gunicorn \
        --bind "0.0.0.0:${FLASK_RUN_PORT}" \
        --access-logfile - \
        --error-logfile - \
        app:app \
        "$@"