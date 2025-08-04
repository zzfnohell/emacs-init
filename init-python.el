;;; init-python.el --- python

;;; Commentary:
;;

;;; Code:

;; The package is "python" but the mode is "python-mode":
(use-package python
  :defer t
  :mode
  ("\\.py\\'" . python-mode)
  :interpreter
  ("python" . python-mode)
  :config
  (py-snippets-initialize))

(use-package yapfify
	:ensure t
  :defer t
  :hook
  (python-mode . yapf-mode))

(use-package python-cell
  :after python-mode
  :ensure t
  :defer t
  :hook
  (python-mode . python-cell-mode))


(use-package pyvenv
	:ensure t
  :defer t
  :commands
  (pyvenv-workon pyvenv-activate)
  :config
  (pyvenv-mode 1)
  (pyvenv-tracking-mode 1))

(use-package cython-mode
	:ensure t
  :defer t
  :mode ("\\.pyx\\'" "\\.pxd\\'" "\\.pxi\\'"))

(use-package pyenv-mode
	:ensure t
  :defer t
  :commands (pyenv-set)
	:config
	(pyenv-mode))

(use-package elpy
  :ensure t
  :defer t
  :init
  (advice-add 'python-mode :before 'elpy-enable))

(use-package conda
  :ensure t
  :defer t
  :config
  ;; if you want interactive shell support, include:
  (conda-env-initialize-interactive-shells)
  ;; if you want eshell support, include:
  (conda-env-initialize-eshell))

(use-package uv-mode
  :ensure t
  :defer t
  :hook
  (python-mode . uv-mode-auto-activate-hook))

(message "loading init-python done.")

(provide 'init-python)
;;; init-python.el ends here
