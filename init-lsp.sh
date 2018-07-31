#! /bin/bash


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

composer require felixfbecker/language-server
