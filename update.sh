#! /bin/bash

local_dir=`readlink -f ${BASH_SOURCE[0]}`

pushd $(dirname $local_dir)

git submodule update --init --recursive

popd
