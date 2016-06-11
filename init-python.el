;;; init-python.el --- python

;;; Commentary:
;; elpy

;;; Code:

(setq python-shell-interpreter "ipython"
		python-shell-interpreter-args "-i")

(require-package 'ac-anaconda)
(require-package 'anaconda-mode)

(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)

;; (add-to-list 'python-shell-extra-pythonpaths "/path/to/the/project")
;; (add-to-list 'python-shell-extra-pythonpaths "/path/to/the/dependency")


(require-package 'ein)
(require 'ein)
(setq ein:use-smartrep t)

(require-package 'jedi)
(require 'jedi)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)
(setq jedi:complete-on-dot t)

(require-package 'highlight-indentation)
(require 'highlight-indentation)
(set-face-background 'highlight-indentation-face "#e3e3d3")
(set-face-background 'highlight-indentation-current-column-face "#c3b3b3")

(require-package 'elpy)
(elpy-enable)

(provide 'init-python)
;;; init-python.el ends here
