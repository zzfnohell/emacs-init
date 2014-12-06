;;; init-cygwin.el --- Setup Cygwin Emacs

;;; Commentary:
;; 

;;; Code:

(if (windows-p)
    (progn
      (require-package 'cygwin-mount)
      (require 'cygwin-mount)
      (cygwin-mount-activate)))
      

(provide 'init-cygwin)

;;; init-cygwin.el ends here
