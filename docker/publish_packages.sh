#!/usr/bin/env bash

set -x

FILE_PATH=$(readlink -f ${BASH_SOURCE[0]})
FILE_DIR=$(dirname ${FILE_PATH})
SRC_DIR=$(dirname ${FILE_DIR})

docker run \
-v ${SRC_DIR}:/code \
-e PYIOC_PYPI_USERNAME \
-e PYIOC_PYPI_PASWWORD \
-e PYIOC_REPOSITORY_URL \
-w="/code" \
python:3 \
bin/publish_packages_docker.sh
