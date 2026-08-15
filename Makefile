# Makefile for recompiling the Emacs init/*.el configuration.
# Targets:
#   make             - byte-compile all *.el (default)
#   make native      - native-compile all *.el (.eln)
#   make both        - byte + native compile all *.el
#   make clean       - remove .elc and .eln artifacts
#   make check       - headless load check of the full config
#   make packages    - refresh package archives and install missing packages
#   make quickstart  - regenerate package-quickstart.el

EMACS    ?= emacs
DIR      := $(CURDIR)

ELCASES  := $(EMACS) --batch -l bytecomp
NATCASES := $(EMACS) --batch -l comp

.PHONY: all native both clean check packages quickstart bootstrap

bootstrap:
	$(EMACS) --batch \
	  --load "$(DIR)/../init.el" \
	  --eval '(message "Package bootstrap complete.")'

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
	  --load "$(DIR)/../init.el"

packages:
	$(EMACS) --batch \
	  --load "$(DIR)/../init.el" \
	  --eval '(package-refresh-contents)'

quickstart:
	$(EMACS) --batch \
	  --load "$(DIR)/../init.el" \
	  --eval '(package-quickstart-refresh)'