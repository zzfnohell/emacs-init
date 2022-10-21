;;; init-lsp.el --- LSP

;;; Commentary:
;;

;;; Code:
(use-package lsp-mode
  :ensure t
  :defer t
  :commands lsp
  :hook ((java-mode . lsp)
         (python-mode . lsp)
         (haskell-mode . lsp)
         (haskell-literate-mode . lsp)
         (latex-mode . lsp)
         (tex-mode . lsp)
         (yatex-mode . lsp)
         (bibtex-mode . lsp)
         (lsp-mode . lsp-enable-which-key-integration))
  :custom
  (lsp-completion-enable t)
	(lsp-completion-provider :capf)
  (lsp-enable-snippet))


;; LSP UI tools
(use-package lsp-ui
  :ensure t
  :defer t
  :commands lsp-ui-mode)

(use-package lsp-ivy
  :ensure t
  :defer t
  :commands lsp-ivy-workspace-symbol)

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package tree-sitter
  :ensure t
  :defer t
  :after lsp
  :config
  (require 'tree-sitter)
	(global-tree-sitter-mode)
	(tree-sitter-hl-mode))

(use-package tree-sitter-langs
  :ensure t
  :defer t
  :after tree-sitter
  :config
  (require 'tree-sitter-langs))

(use-package lsp-treemacs
	:ensure t
  :defer t
	:config
	(lsp-treemacs-sync-mode 1))


;; https://github.com/emacs-lsp/lsp-docker
;; (use-package lsp-docker :ensure t)

(use-package lsp-haskell
  :after haskell-mode
  :ensure t
  :defer t
  :config
  (add-hook 'haskell-mode-hook #'lsp)
  (add-hook 'haskell-literate-mode-hook #'lsp))


(message "loading init-lsp done.")

(provide 'init-lsp)

;;; init-lsp.el ends here
