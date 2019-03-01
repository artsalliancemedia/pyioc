#!/usr/bin/env bash

set -ex

FILE_PATH=$(readlink -f ${BASH_SOURCE[0]})
FILE_DIR=$(dirname ${FILE_PATH})
SRC_DIR=$(dirname ${FILE_DIR})

cd /
cp -r /code /build
cd /build
pip install -U setuptools wheel
python setup.py sdist bdist_wheel

cp -r /build/dist /code/dist
chmod -R 777 /code/dist
