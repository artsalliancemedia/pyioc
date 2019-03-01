#!/usr/bin/env bash

set -x

FILE_PATH=$(readlink -f ${BASH_SOURCE[0]})
FILE_DIR=$(dirname ${FILE_PATH})
SRC_DIR=$(dirname ${FILE_DIR})

PYTHON_VERSION="${PYTHON_VERSION:-3}"
PYTHON_IMAGE=python:${PYTHON_VERSION}

mkdir -p reports

docker run \
-v ${SRC_DIR}:/code \
-e PYTHON_VERSION=${PYTHON_VERSION} \
-w="/code" \
${PYTHON_IMAGE} \
bin/run_tests_docker.sh


