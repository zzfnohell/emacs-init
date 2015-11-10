;;; init-python.el --- python

;;; Commentary:
;; elpy

;;; Code:
(require-package 'anaconda-mode)
(require-package 'ein)
(require-package 'jedi)

(require-package 'elpy)
(require 'elpy)
(elpy-enable)

(provide 'init-python)
;;; init-python.el ends here
