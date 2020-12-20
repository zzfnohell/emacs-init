;;; init-dired.el --- dired
;;; Code:

;;; Commentary:
;;

(require 'ls-lisp)

(require 'dired)

(setq dired-listing-switches "-alh")

(when (eq system-type 'windows-nt)
  (setq find-program (purecopy "gfind")))

(when (eq system-type 'darwin)
  (setq dired-use-ls-dired nil))

(provide 'init-dired)

;;; init-dired.el ends here
