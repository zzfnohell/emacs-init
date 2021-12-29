;;; init-dired.el --- dired -*- lexical-binding: t -*-

;;; Commentary:
;; 

;;; Code:

(require 'dired)
(setq dired-listing-switches "-alh")

(when (eq system-type 'darwin)
  (setq dired-use-ls-dired nil))

(when (eq system-type 'windows-nt)
  (setq w32-get-true-file-attributes nil)
  (global-auto-revert-mode -1))

(require 'tramp-gvfs)
  
(message "loading init-dired done.")
(provide 'init-dired)

;;; init-dired.el ends here
