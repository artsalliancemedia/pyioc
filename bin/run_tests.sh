#!/usr/bin/env bash

set -e

FILE_PATH=$(readlink -f ${BASH_SOURCE[0]})
FILE_DIR=$(dirname ${FILE_PATH})
SRC_DIR=$(dirname ${FILE_DIR})

pip install .[dev,test]
python -m pytest tests/
