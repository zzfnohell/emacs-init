.PHONY:clean compile

compile:
	emacs --batch --load byte-compile.el 
	@echo 'done'

clean:
	rm -v *.elc
