;;; init-cvs.el --- Concurrent Version System

;;; Commentary:
;; 

;;; Code:
(require-package 'dsvn)
(autoload 'svn-status "dsvn" "Run `svn status'." t)
(autoload 'svn-update "dsvn" "Run `svn update'." t)
(require 'vc-svn)

(provide 'init-cvs)

;;; init-cvs.el ends here
