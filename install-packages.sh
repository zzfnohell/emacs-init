#! /bin/bash

src_path=`readlink -f ${BASH_SOURCE[0]}`
src_path=`dirname $src_path`

pushd $src_path

# rm -rf ~/.emacs.d/eclipse.jdt.ls/server/
if [ ! -f ~/.emacs.d/eclipse.jdt.ls/jdt-latest.tar ]; then
  mkdir -p ~/.emacs.d/eclipse.jdt.ls/server/
  wget http://download.eclipse.org/jdtls/snapshots/jdt-language-server-latest.tar.gz -O ~/.emacs.d/eclipse.jdt.ls/jdt-latest.tar
  tar xf ~/.emacs.d/eclipse.jdt.ls/jdt-latest.tar -C ~/.emacs.d/eclipse.jdt.ls/server/
if

composer require felixfbecker/language-server

conda install -y virtualenv
conda install -y cython
conda install -y yapf
conda install -y flake8
conda install -y jedi
conda install -y jupyter

pip install python-language-server[all]
# and importmagic for automatic imports
pip install importmagic
pip install epc
pip install pyflakes
pip install rope_py3k
pip install trepan3k


rustup update
rustup component add rls-preview rust-analysis rust-src

popd
