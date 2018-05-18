;;; init-lsp.el --- LSP



;;; Commentary:
;; 

;;; Code:

(req-package lsp-mode
	:demand
	:config
	(add-hook 'prog-major-mode #'lsp-prog-major-mode-enable)
	(require 'lsp-imenu)
	(add-hook 'lsp-after-open-hook 'lsp-enable-imenu)
	)
(req-package lsp-ui :demand :require lsp-mode)

(req-package lsp-rust
	:demand
	:config
	(with-eval-after-load 'lsp-mode
		(require 'lsp-rust)
		(add-hook 'rust-mode-hook #'lsp-rust-enable))
	)

(req-package lsp-python
	:demand
	:config
	(add-hook 'python-mode-hook #'lsp-python-enable)
	)



(provide 'init-lsp)

;;; init-lsp.el ends here
