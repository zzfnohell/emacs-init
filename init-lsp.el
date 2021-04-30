;;; init-lsp.el --- LSP

;;; Commentary:
;;

;;; Code:
(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :hook (
         (python-mode . lsp)
         (lsp-mode . lsp-enable-which-key-integration))
  :custom
  (lsp-enable-completion-at-point t)
  (lsp-prefer-capf t))

;; LSP UI tools
(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

(use-package lsp-ivy
  :ensure t
  :commands lsp-ivy-workspace-symbol)

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package tree-sitter
  :ensure t
  :config
  (require 'tree-sitter))

(use-package tree-sitter-langs
  :ensure t
  :config
  (require 'tree-sitter-langs))

(use-package lsp-treemacs
	:ensure t
	:config
	(lsp-treemacs-sync-mode 1))

(message "loading init-lsp done.")

(provide 'init-lsp)

;;; init-lsp.el ends here
