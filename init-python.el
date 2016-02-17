;;; init-python.el --- python

;;; Commentary:
;; elpy

;;; Code:

(require-package 'ac-anaconda)
(require-package 'anaconda-mode)

(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)

;; (add-to-list 'python-shell-extra-pythonpaths "/path/to/the/project")
;; (add-to-list 'python-shell-extra-pythonpaths "/path/to/the/dependency")

(require-package 'ein)
(require-package 'jedi)
(add-hook 'python-mode-hook 'jedi:setup)
;; (setq jedi:setup-keys t)                      ; optional
;; (setq jedi:complete-on-dot t)                 ; optional

(require-package 'elpy)
(elpy-enable)

(provide 'init-python)
;;; init-python.el ends here
