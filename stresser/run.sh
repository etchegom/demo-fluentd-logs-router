#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd ${CURRENT_DIR}

#--network logscollector_logs-collector-net \
#--log-opt tag="docker.{{.ID}}" \

docker run -it --rm \
    --name logs-collector-stresser \
    --log-driver=fluentd \
    --log-opt fluentd-address=172.22.0.3:24224 \
    -v "$PWD":/usr/src/myapp \
    -w /usr/src/myapp \
    python:alpine python stresser.py
