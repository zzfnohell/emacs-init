;;; init-cygwin.el --- Setup Cygwin Emacs

;;; Commentary:
;; 

;;; Code:

(if (cygwin-p)
	(progn
	  (require-package 'cygwin-mount)
	  (require 'cygwin-mount)
	  (cygwin-mount-activate)
	  
	  (require-package 'setup-cygwin)
	  (require 'setup-cygwin)
	  (customize-set-variable
	   'cygwin-root-directory
	   (getenv "CYGWIN_ROOT"))
	  ))

(provide 'init-cygwin)

;;; init-cygwin.el ends here
