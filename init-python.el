;;; init-python.el --- python

;;; Commentary:
;; elpy

;;; Code:


(use-package anaconda-mode
  :config
  (add-hook 'python-mode-hook 'anaconda-mode)
  (add-hook 'python-mode-hook 'anaconda-eldoc-mode))

(use-package python-mode
  ;; (add-to-list 'python-shell-extra-pythonpaths "/path/to/the/project")
  ;; (add-to-list 'python-shell-extra-pythonpaths "/path/to/the/dependency")
  )


(use-package ein
  :config (setq ein:use-smartrep t))

(use-package jedi
  :config
  (progn
    (setq jedi:complete-on-dot t)
    (add-hook 'python-mode-hook 'jedi:setup)
    (add-hook 'python-mode-hook 'jedi:ac-setup)))

(use-package highlight-indentation
  :config
	(set-face-background 'highlight-indentation-face "#e3e3d3")
	(set-face-background 'highlight-indentation-current-column-face "#c3b3b3")
  )

(use-package elpy
  :config
	(elpy-enable)
	(defalias 'workon 'pyvenv-workon)
	(setq elpy-rpc-backend "jedi"))

(use-package pyvenv
  :config
	(setenv "WORKON_HOME" (expand-file-name "~/anaconda3/envs/"))
	(pyvenv-mode 1)
	(pyvenv-tracking-mode 1))


(use-package yapfify
  :config (add-hook 'python-mode-hook 'yapf-mode))

(use-package cython-mode)

(use-package flycheck-cython)

(provide 'init-python)
;;; init-python.el ends here
