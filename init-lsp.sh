#! /bin/bash


npm i -g vscode-html-languageserver-bin
npm i -g vscode-css-languageserver-bin

# rm -rf ~/.emacs.d/eclipse.jdt.ls/server/
mkdir -p ~/.emacs.d/eclipse.jdt.ls/server/
wget http://download.eclipse.org/jdtls/snapshots/jdt-language-server-latest.tar.gz -O ~/.emacs.d/eclipse.jdt.ls/server/jdt-latest.tar
tar xf ~/.emacs.d/eclipse.jdt.ls/server/jdt-latest.tar -C ~/.emacs.d/eclipse.jdt.ls/server/


pip install 'python-language-server[all]'
