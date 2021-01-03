;;; init-python.el --- python

;;; Commentary:
;; elpy

;;; Code:
(use-package python-mode
  ;; (add-to-list 'python-shell-extra-pythonpaths "/path/to/the/project")
  ;; (add-to-list 'python-shell-extra-pythonpaths "/path/to/the/dependency")
  )

;; (use-package jedi
;;   :config
;;   (progn
;;     (setq jedi:complete-on-dot t)
;;     (add-hook 'python-mode-hook 'jedi:setup)
;;     (add-hook 'python-mode-hook 'jedi:ac-setup)))

;; (use-package elpy
;;   :config
;; 	(elpy-enable)
;; 	(defalias 'workon 'pyvenv-workon)
;; 	(setq elpy-rpc-backend "jedi"))

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


(use-package python-pytest
  :custom
  (python-pytest-confirm t))

(provide 'init-python)
;;; init-python.el ends here
