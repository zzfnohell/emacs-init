;;; init-rust.el --- RUST
;; packages required in hooks

;;; Commentary:
;; 

;;; Code:
(use-package rust-mode
  :after flycheck-mode
  :mode ("\\.rs\\'" . rust-mode)
  :hook ((rust-mode . lsp)))

(use-package flycheck-rust
  :config
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

(use-package toml-mode)

(provide 'init-rust)

;;; init-rust.el ends here
