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

;; (use-package racer
;;   :after rust-mode company
;;   :config
;;   (add-hook 'racer-mode-hook #'company-mode)
;;   (require 'rust-mode)
;;   (define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
;;   (setq company-tooltip-align-annotations t)
  
;;   (add-hook 'rust-mode-hook #'racer-mode)
;;   (add-hook 'racer-mode-hook #'eldoc-mode))

(use-package rust-auto-use)

(use-package rust-playground)

(provide 'init-rust)

;;; init-rust.el ends here
