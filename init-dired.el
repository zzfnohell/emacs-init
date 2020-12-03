;;; init-dired.el --- dired
;;; Code:

;;; Commentary:
;;

(require 'ls-lisp)
(use-package fd-dired :ensure t)
(use-package dired
  :config
  (setq dired-listing-switches "-alh"))

(provide 'init-dired)

;;; init-dired.el ends here
