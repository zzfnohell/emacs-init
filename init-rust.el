;;; init-rust.el --- RUST
;; packages required in hooks

;;; Commentary:
;; 

;;; Code:


(use-package rust-mode
	:ensure t
	:mode ("\\.rs\\'" . rust-mode)
	:config
	(require 'lsp-rust)
	(require 'flycheck-rust)

	(add-hook 'rust-mode-hook #'flycheck-mode)
	(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
	)

(use-package lsp-rust
	:after (:all markdown-mode lsp-mode rust-mode)
	:ensure t
	(add-hook 'rust-mode-hook #'lsp-rust-enable)
	)

(use-package flycheck-rust
	:ensure t
	)      

(provide 'init-rust)

;;; init-rust.el ends here
