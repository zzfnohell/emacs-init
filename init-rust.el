;;; init-rust.el --- RUST
;; packages required in hooks

;;; Commentary:
;; 

;;; Code:
(use-package rust-mode
  :ensure t
  :mode
  ("\\.rs\\'" . rust-mode))

(use-package flycheck-rust
  :ensure t
  :hook
  (flycheck-mode . flycheck-rust-setup))

(use-package toml-mode
  :ensure t
  :defer t
  :mode ("\\.toml\\'" . toml-mode))

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
  :ensure t
  :defer t
  :hook
  (rust-mode . rust-auto-use-mode))

(use-package rust-playground
  :ensure t
  :commands rust-playground)

(provide 'init-rust)

;;; init-rust.el ends here
