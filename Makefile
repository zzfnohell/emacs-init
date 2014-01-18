.PHONY:clean

SOURCE := $(wildcard *.el)

OBJECTS :=  $(basename $(SOURCE))
ELC_FILES := $(addsuffix .elc,$(OBJECTS))

# targets
compile:$(ELC_FILES)
	@echo 'done'

%.elc:%.el
	emacs --batch --eval '(byte-compile-file "$^")'

clean:
	rm -v *.elc
