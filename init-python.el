;;; init-python.el --- python

;;; Commentary:
;;

;;; Code:

;; Built-in package; mode may be remapped to python-ts-mode via
;; major-mode-remap-alist in init-prog.el.
(use-package python
  :ensure nil
  :defer t
  :config
  (when (fboundp 'py-snippets-initialize)
    (py-snippets-initialize)))

(use-package python-cell
  :after python
  :ensure t
  :defer t
  :hook
  (python-mode . python-cell-mode)
  (python-ts-mode . python-cell-mode))

(use-package uv-mode
  :ensure t
  :defer t
  :hook
  (python-mode . uv-mode-auto-activate-hook)
  (python-ts-mode . uv-mode-auto-activate-hook))

(use-package cython-mode
  :ensure t
  :defer t
  :mode ("\\.pyx\\'" "\\.pxd\\'" "\\.pxi\\'"))

;; elpy omitted: conflicts with eglot/dap (see init-lsp.el). Prefer
;; eglot + dap-python for IDE features.

(message "loading init-python done.")

(provide 'init-python)
;;; init-python.el ends here
