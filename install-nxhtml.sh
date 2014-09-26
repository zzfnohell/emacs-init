#!/bin/bash

# MUST be executed under cygwin on windows
pushd ~
mkdir -p .emacs.d
cd .emacs.d
mkdir -p site-lisp
cd site-lisp
mkdir -p nxhtml
cd nxhtml
bzr branch lp:emacs
popd
