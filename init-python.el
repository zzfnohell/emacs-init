;;; init-python.el --- python

;;; Commentary:
;; elpy

;;; Code:
(use-package python-mode
  :ensure t
  :custom
  (python-shell-interpreter "ipython")
  (python-shell-interpreter-args "-i --simple-prompt")
  ;; (add-to-list 'python-shell-extra-pythonpaths "/path/to/the/project")
  ;; (add-to-list 'python-shell-extra-pythonpaths "/path/to/the/dependency")
  )

(use-package python-cell
  :after python-mode
  :ensure t
  :config
  (add-hook 'python-mode-hook #'python-cell-mode 1))

(use-package highlight-indentation
	:ensure t
  :config
	(set-face-background 'highlight-indentation-face "#e3e3d3")
  (set-face-background 'highlight-indentation-current-column-face "#c3b3b3"))

(use-package pyvenv
	:ensure t
  :config
  (pyvenv-mode 1)
  (pyvenv-tracking-mode 1))

(use-package yapfify
	:ensure t
  :config (add-hook 'python-mode-hook 'yapf-mode))

(use-package cython-mode
	:ensure t)

(use-package flycheck-cython
	:ensure t)

(use-package pyenv-mode
	:ensure t
	:config
	(pyenv-mode))

(provide 'init-python)
;;; init-python.el ends here
