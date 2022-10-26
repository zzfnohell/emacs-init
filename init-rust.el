;;; init-rust.el --- RUST
;; packages required in hooks

;;; Commentary:
;; 

;;; Code:
(use-package rust-mode
  :ensure t
  :defer t
  :mode ("\\.rs\\'" . rust-mode))

(use-package flycheck-rust
  :ensure t
  :defer t
  :hook ((flycheck-mode-hook . flycheck-rust-setup)))

(use-package toml-mode
  :ensure t)

;; (use-package racer
;;   :after rust-mode company
;;   :config
;;   (add-hook 'racer-mode-hook #'company-mode)
;;   (require 'rust-mode)
;;   (define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
;;   (setq company-tooltip-align-annotations t)
  
;;   (add-hook 'rust-mode-hook #'racer-mode)
;;   (add-hook 'racer-mode-hook #'eldoc-mode))

(use-package rust-auto-use
  :ensure t)

(use-package rust-playground
  :ensure t
  :defer t)

(provide 'init-rust)

;;; init-rust.el ends here
