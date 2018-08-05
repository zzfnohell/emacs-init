;;; init-rust.el --- RUST
;; packages required in hooks

;;; Commentary:
;; 

;;; Code:


(use-package rust-mode
	:ensure t
	:defer t
	:mode ("\\.rs\\'" . rust-mode)
	:config
	(require 'lsp-rust)
	(require 'flycheck-rust)
	(add-hook 'rust-mode-hook #'lsp-rust-enable)
	(add-hook 'rust-mode-hook #'flycheck-mode)
	(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
	)

(use-package lsp-rust
	:after (:all markdown-mode lsp-mode)
	:ensure t
	:defer t
	)

(use-package flycheck-rust
	:ensure t
	:defer t
	)      

(provide 'init-rust)

;;; init-rust.el ends here
