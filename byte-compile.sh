#! /bin/bash


local_dir=`readlink -f ${BASH_SOURCE[0]}`

pushd $(dirname $local_dir)

emacs --batch --load ./byte-compile.el 

popd
