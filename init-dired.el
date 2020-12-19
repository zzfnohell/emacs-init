;;; init-dired.el --- dired
;;; Code:

;;; Commentary:
;;

(require 'ls-lisp)

(require 'dired)
(when (eq system-type 'windows-nt)
  (setq find-program (purecopy "gfind")))

(setq dired-listing-switches "-alh")

(provide 'init-dired)

;;; init-dired.el ends here
