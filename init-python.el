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

(use-package uv-mode
  :ensure t
  :defer t
  :hook (python-mode . uv-mode-auto-activate-hook))

(use-package cython-mode
	:ensure t
  :defer t
  :mode ("\\.pyx\\'" "\\.pxd\\'" "\\.pxi\\'"))

(use-package elpy
  :ensure t
  :defer t
  :init
  (advice-add 'python-mode :before 'elpy-enable))

(message "loading init-python done.")

(provide 'init-python)
;;; init-python.el ends here
