;;; init-lsp.el --- LSP

;;; Commentary:
;;

;;; Code:
(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :hook ((java-mode . lsp)
         (python-mode . lsp)
         (lsp-mode . lsp-enable-which-key-integration))
  :custom
  (lsp-completion-enable t)
	(lsp-completion-provider :capf)
  (lsp-enable-snippet))


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
  :after lsp
  :config
  (require 'tree-sitter)
	(global-tree-sitter-mode)
	(tree-sitter-hl-mode))

(use-package tree-sitter-langs
  :ensure t
  :after tree-sitter
  :config
  (require 'tree-sitter-langs))

(use-package lsp-treemacs
	:ensure t
	:config
	(lsp-treemacs-sync-mode 1))

(message "loading init-lsp done.")

(provide 'init-lsp)

;;; init-lsp.el ends here
