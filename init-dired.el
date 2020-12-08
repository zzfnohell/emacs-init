;;; init-dired.el --- dired
;;; Code:

;;; Commentary:
;;

(require 'ls-lisp)
(require 'dired)
(setq dired-listing-switches "-alh")

(use-package fd-dired :ensure t)
(provide 'init-dired)

;;; init-dired.el ends here
