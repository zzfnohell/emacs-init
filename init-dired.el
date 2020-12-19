;;; init-dired.el --- dired
;;; Code:

;;; Commentary:
;;

(require 'ls-lisp)
(require 'dired)

(when (eq system-type 'windows-nt)
  (setq find-program "gfind"))

(setq dired-listing-switches "-alh")

(use-package fd-dired :ensure t)
(provide 'init-dired)

;;; init-dired.el ends here
