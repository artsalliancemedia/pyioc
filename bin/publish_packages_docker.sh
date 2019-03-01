#!/usr/bin/env bash

set -e

FILE_PATH=$(readlink -f ${BASH_SOURCE[0]})
FILE_DIR=$(dirname ${FILE_PATH})
SRC_DIR=$(dirname ${FILE_DIR})

REPOSITORY_URL="${PYIOC_REPOSITORY_URL:-https://test.pypi.org/legacy/}"
export TWINE_PASSWORD=${PYIOC_PYPI_PASSWORD}

pip install -U twine

python -m twine upload --verbose --repository-url ${REPOSITORY_URL} -u ${PYIOC_PYPI_USERNAME} dist/*
