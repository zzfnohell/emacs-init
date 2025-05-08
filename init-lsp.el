;;; init-lsp.el --- LSP

;;; Commentary:
;;

;;; Code:
(use-package lsp-mode
  :disabled
  :ensure t
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
  :disabled
  :ensure t
  :commands lsp-ui-mode)

(use-package lsp-ivy
  :disabled
  :ensure t
  :commands lsp-ivy-workspace-symbol)


;; https://github.com/emacs-lsp/lsp-docker
;; (use-package lsp-docker :ensure t)

(use-package lsp-haskell
  :disabled
  :after haskell-mode
  :ensure t
  :config
  (add-hook 'haskell-mode-hook #'lsp)
  (add-hook 'haskell-literate-mode-hook #'lsp))

(use-package lsp-java
  :disabled
  :ensure t
  :after lsp-mode
	:config
	(require 'lsp-java-boot)

	;; to enable the lenses
	(add-hook 'lsp-mode-hook #'lsp-lens-mode)
	(add-hook 'java-mode-hook #'lsp-java-lens-mode))

(use-package lsp-julia
  :disabled
	:ensure t
  :after (:all julia-mode lsp-mode)
  :hook ((julia-mode-hook . lsp-mode)
         (julia-mode-hook . lsp)))

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package eglot
  :ensure t
  :hook ((go-mode . eglot-ensure)
         (haskell-mode . eglot-ensure)
         (csharp-mode . eglot-ensure)
         (rust-mode . eglot-ensure))
  :bind (:map eglot-mode-map
              ("C-c a r" . #'eglot-rename)
              ("C-c C-c" . #'eglot-code-actions))
  :custom
  (eglot-autoshutdown t))

(use-package eglot-fsharp
  :requires eglot
  :ensure t)

(use-package eglot-java
  :requires eglot
  :ensure t)

(use-package xref
  :ensure t
  :defer t
  :commands (xref-find-definitions
             xref-find-references)
  :bind (("s-r" . #'xref-find-references)
         ("s-[" . #'xref-go-back)
         ("C-<down-mouse-2>" . #'xref-go-back)
         ("s-]" . #'xref-go-forward)))

(use-package eldoc
  :bind ("s-d" . #'eldoc)
  :custom (eldoc-echo-area-prefer-doc-buffer t))

(message "loading init-lsp done.")

(provide 'init-lsp)

;;; init-lsp.el ends here
