#!/usr/bin/env bash

set -ex

FILE_PATH=$(readlink -f ${BASH_SOURCE[0]})
FILE_DIR=$(dirname ${FILE_PATH})
SRC_DIR=$(dirname ${FILE_DIR})

cd /
cp -r /code /tests
cd /tests
pip install .[dev,test]
python -m pytest tests/ --junitxml=/tests/${PYTHON_VERSION}.xml

cp -r /tests/${PYTHON_VERSION}.xml /code/reports/${PYTHON_VERSION}.xml
chmod 777 /code/reports/${PYTHON_VERSION}.xml
