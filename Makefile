# Makefile for recompiling the Emacs init/*.el configuration.
#
# Targets:
#   make            - bootstrap packages, then byte-compile all *.el (default)
#   make native     - bootstrap packages, then native-compile all *.el (.eln)
#   make both       - bootstrap packages, then byte + native compile all *.el
#   make clean      - remove .elc and .eln artifacts
#   make check      - headless load check of the full config
#   make packages   - refresh package archives
#   make bootstrap  - refresh package archives, install missing packages,
#                     and regenerate package-quickstart.el
#   make quickstart - regenerate package-quickstart.el

EMACS    ?= emacs
DIR      := $(CURDIR)
INIT     := $(DIR)/../init.el
ELCASES  := $(EMACS) --batch -l bytecomp
NATCASES := $(EMACS) --batch -l comp

.PHONY: all native both clean check packages bootstrap quickstart

# Refresh package archives first, then load the full configuration.
# use-package :ensure t installs missing packages.
# Finally regenerate package-quickstart.el.
bootstrap:
	$(EMACS) --batch \
	  --load "$(DIR)/init-elpa.el" \
	  --eval '(package-refresh-contents)' \
	  --load "$(INIT)" \
	  --eval '(package-quickstart-refresh)'

all: bootstrap
	$(ELCASES) \
	  --eval '(byte-recompile-directory "$(DIR)" 0 t)'

native: bootstrap
	$(NATCASES) \
	  --eval '(native-compile-async "$(DIR)" t)'

both: all native

clean:
	$(EMACS) --batch \
	  --eval '(dolist (ext (list ".elc" ".eln")) '\
	  '(dolist (f (directory-files-recursively "$(DIR)" (concat ".*" ext "\\'"))) '\
	  '(delete-file f)))'

check:
	$(EMACS) --batch \
	  --load "$(INIT)"

packages:
	$(EMACS) --batch \
	  --load "$(DIR)/init-elpa.el" \
	  --eval '(package-refresh-contents)'

quickstart:
	$(EMACS) --batch \
	  --load "$(DIR)/init-elpa.el" \
	  --eval '(package-quickstart-refresh)'