;;; init-python.el --- python

;;; Commentary:
;; elpy

;;; Code:

(require-package 'elpy)
(require 'elpy)
(package-initialize)
(elpy-enable)
(setq elpy-rpc-backend "native")

(provide 'init-python)
;;; init-python.el ends here
