;;; init-rust.el --- RUST
;; packages required in hooks

;;; Commentary:
;; 

;;; Code:


(use-package rust-mode
  :after flycheck-mode
  :mode ("\\.rs\\'" . rust-mode)
  :config
  (add-hook 'rust-mode-hook #'flycheck-mode)
  )

(use-package lsp-rust
  :after (:all markdown-mode lsp-mode rust-mode)
	:config
  (add-hook 'rust-mode-hook #'lsp-rust-enable)
  )

(use-package flycheck-rust
  :config
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
  )

(provide 'init-rust)

;;; init-rust.el ends here
