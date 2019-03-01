#!/usr/bin/env bash

set -ex

FILE_PATH=$(readlink -f ${BASH_SOURCE[0]})
FILE_DIR=$(dirname ${FILE_PATH})
SRC_DIR=$(dirname ${FILE_DIR})

REPOSITORY_URL="${PYIOC_REPOSITORY_URL:-https://test.pypi.org/legacy/}"

pip install -U twine

python -m twine upload --repository-url ${REPOSITORY_URL} -u ${PYIOC_PYPI_USERNAME} -p ${PYIOC_PYPI_PASSWORD} dist/*
