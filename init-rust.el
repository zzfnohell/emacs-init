;;; init-rust.el --- RUST
;; packages required in hooks

;;; Commentary:
;; 

;;; Code:


(req-package rust-mode
	:demand
	:config
	(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))
	)

(req-package flycheck-rust
	:require rust-mode
	:demand
	:config
	(with-eval-after-load 'rust-mode
      (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)))

(provide 'init-rust)

;;; init-rust.el ends here
