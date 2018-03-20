#! /bin/bash

src_path=`readlink -f ${BASH_SOURCE[0]}`
src_path=`dirname $src_path`

pushd $src_path

file_name=packages.txt
apt-get install $(grep -vE "^\s*#" $file_name  | tr "\n" " ")

popd
