;;; init-rust.el --- RUST
;; packages required in hooks

;;; Commentary:
;; 

;;; Code:


(use-package rust-mode
	:ensure t
	:config
	(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))
	)

(use-package flycheck-rust
	:ensure t
	:config
	(with-eval-after-load 'rust-mode
      (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)))

(provide 'init-rust)

;;; init-rust.el ends here
