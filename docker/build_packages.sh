#!/usr/bin/env bash

set -x

FILE_PATH=$(readlink -f ${BASH_SOURCE[0]})
FILE_DIR=$(dirname ${FILE_PATH})
SRC_DIR=$(dirname ${FILE_DIR})


mkdir -p reports

docker run \
-v ${SRC_DIR}:/code \
-w="/code" \
python:3 \
bin/build_packages_docker.sh


