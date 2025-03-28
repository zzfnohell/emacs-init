;;; init-python.el --- python

;;; Commentary:
;;

;;; Code:

;; The package is "python" but the mode is "python-mode":
(use-package python
  :mode
  ("\\.py\\'" . python-mode)
  :interpreter
  ("python" . python-mode)
  :custom
  (python-shell-interpreter "ipython")
  (python-shell-interpreter-args "--pylab --pdb --nosep --simple-prompt")
  :config
  (message "config python mode")
  (py-snippets-initialize))

(use-package yapfify
	:ensure t
  :hook
  (python-mode . yapf-mode))

(use-package python-cell
  :after python-mode
  :ensure t
  :hook
  (python-mode . python-cell-mode))


(use-package pyvenv
	:ensure t
  :defer t
  :config
  (pyvenv-mode 1)
  (pyvenv-tracking-mode 1))

(use-package cython-mode
	:ensure t
  :defer t)

(use-package pyenv-mode
	:ensure t
  :defer t
	:config
	(pyenv-mode))

(use-package jupyter
	:ensure t
  :defer t)

(use-package elpy
  :ensure t
  :defer t
  :config
  (elpy-disable))

(use-package conda
  :ensure t
  :defer t
  :config
  ;; if you want interactive shell support, include:
  (conda-env-initialize-interactive-shells)
  ;; if you want eshell support, include:
  (conda-env-initialize-eshell))

(message "loading init-python done.")

(provide 'init-python)
;;; init-python.el ends here
