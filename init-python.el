;;; init-python.el --- python

;;; Commentary:
;; elpy

;;; Code:

(require 'package)
(add-to-list 'package-archives
             '("elpy" . "http://jorgenschaefer.github.io/packages/"))

(require-package 'elpy)
(require 'elpy)
(package-initialize)
(elpy-enable)
(setq elpy-rpc-backend "native")

(provide 'init-python)
;;; init-python.el ends here
