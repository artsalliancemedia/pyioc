#!/usr/bin/env bash
set -x

FILE_PATH=$(readlink -f ${BASH_SOURCE[0]})
FILE_DIR=$(dirname ${FILE_PATH})
SRC_DIR=$(dirname ${FILE_DIR})

rm -rf build
rm -rf dist
rm -rf reports
rm -rf .pytest_cache
