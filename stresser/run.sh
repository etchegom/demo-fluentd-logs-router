#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd ${CURRENT_DIR}

CONTAINER_NAME=$(docker inspect --format "{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}" logscollector_fluentd_1)

#--network logscollector_logs-collector-net \
#--log-opt tag="docker.{{.ID}}" \

docker run -it --rm \
    --name logs-collector-stresser \
    --log-driver=fluentd \
    --log-opt fluentd-address=${CONTAINER_NAME}:24224 \
    -e PYTHONUNBUFFERED=0 \
    -v "$PWD":/usr/src/myapp \
    -w /usr/src/myapp \
    python:alpine python stresser.py
