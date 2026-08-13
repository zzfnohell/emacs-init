# Makefile for recompiling the Emacs init/*.el configuration.
# Targets:
#   make            - byte-compile all *.el (default)
#   make native     - native-compile all *.el (.eln)
#   make both       - byte + native compile all *.el
#   make clean      - remove .elc and .eln artifacts
#   make check      - headless load check of the full config
#   make packages   - refresh package archives and install missing packages

EMACS   ?= emacs
DIR     := $(CURDIR)
ELCASES := $(strip $(EMACS) --batch -l bytecomp)
NATCASES:= $(strip $(EMACS) --batch -l comp)

.PHONY: all native both clean check packages

all:
	$(ELCASES) \
	  --eval '(byte-recompile-directory "$(DIR)" 0 t)'

native:
	$(NATCASES) \
	  --eval '(native-compile-async "$(DIR)" t)'

both: all
	$(NATCASES) \
	  --eval '(native-compile-async "$(DIR)" t)'

clean:
	$(EMACS) --batch \
	  --eval '(dolist (ext (list ".elc" ".eln")) '\
	  '(dolist (f (directory-files-recursively "$(DIR)" (concat ".*" ext "\\'"))) '\
	  '(delete-file f)))'

check:
	$(EMACS) --batch --load "$(DIR)/init.el"

packages:
	$(EMACS) --batch \
	  --eval '(progn (require (quote package)) (package-refresh-contents))' \
	  --load "$(DIR)/init.el"