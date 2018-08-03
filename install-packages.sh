#! /bin/bash

src_path=`readlink -f ${BASH_SOURCE[0]}`
src_path=`dirname $src_path`

pushd $src_path

file_name=packages.txt
apt-get install $(grep -vE "^\s*#" $file_name  | tr "\n" " ")

npm i -g vscode-html-languageserver-bin
npm i -g vscode-css-languageserver-bin
npm i -g javascript-typescript-langserver
npm i -g flow-language-server
npm i -g ocaml-language-server

# rm -rf ~/.emacs.d/eclipse.jdt.ls/server/
mkdir -p ~/.emacs.d/eclipse.jdt.ls/server/
wget http://download.eclipse.org/jdtls/snapshots/jdt-language-server-latest.tar.gz -O ~/.emacs.d/eclipse.jdt.ls/jdt-latest.tar
tar xf ~/.emacs.d/eclipse.jdt.ls/jdt-latest.tar -C ~/.emacs.d/eclipse.jdt.ls/server/


pip install 'python-language-server[all]'

go get -u github.com/sourcegraph/go-langserver
curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh

composer require felixfbecker/language-server


# and importmagic for automatic imports
pip install importmagic

pip install cython
pip install epc
pip install flake8
pip install jedi
pip install jupyter
pip install pyflakes
pip install rope_py3k
pip install trepan3k
pip install yapf


popd
