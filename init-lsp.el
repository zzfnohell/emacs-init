;;; init-lsp.el --- LSP

;;; Commentary:
;;

;;; Code:
(use-package lsp-mode
  :disabled
  :ensure t
  :commands lsp
  :hook ((java-mode . lsp-deferred)
         (python-mode . lsp-deferred)
         (haskell-mode . lsp-deferred)
         (haskell-literate-mode . lsp-deferred)
         (latex-mode . lsp-deferred)
         (tex-mode . lsp-deferred)
         (yatex-mode . lsp-deferred)
         (bibtex-mode . lsp-deferred)
         (js-mode . lsp-deferred)
         (js2-mode . lsp-deferred)
         (rjsx-mode .lsp-deferred)
         (typescript-mode . lsp-deferred)
         (lsp-mode . lsp-enable-which-key-integration))
  :custom
  (lsp-completion-enable t)
	(lsp-completion-provider :capf)
  (lsp-enable-snippet)
  :config
  (require 'lsp-flow))


;; LSP UI tools
(use-package lsp-ui
  :disabled
  :ensure t
  :commands lsp-ui-mode)

(use-package lsp-ivy
  :disabled
  :ensure t
  :commands lsp-ivy-workspace-symbol)



(defun init-lsp/dap-stop-hook-func (arg)
  (call-interactively #'dap-hydra))

(use-package dap-mode
  :ensure t
  :defer t
  :after lsp-mode
  :commands dap-debug
  :hook
  ((python-mode . dap-ui-mode)
   (python-mode . dap-mode))
  :config
	(dap-auto-configure-mode)
  (require 'dap-gdb)

  (require 'dap-go)
  (require 'dap-chrome)

  (require 'dap-python)
  (setq dap-python-debugger 'debugpy)
  (defun dap-python--pyenv-executable-find (command)
    (executable-find "python"))

  (add-hook 'dap-stopped-hook #'init-lsp/dap-stop-hook-func)


  (require 'dap-pwsh)
  (require 'dap-node))



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
  :ensure t
  :defer t
  :after (lsp-mode dap-mode java-mode)
	:config
  (require 'dap-java)
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
  :defer t
  :commands eglot
  :bind (:map eglot-mode-map
              ("C-c a r" . #'eglot-rename)
              ("C-c C-c" . #'eglot-code-actions))
  :custom
  (eglot-autoshutdown t)
  :config
  (add-to-list 'eglot-server-programs
               '((js-mode
                  rjsx-mode
                  js-ts-mode
                  tsx-ts-mode)
                 . ("flow" "lsp"))))

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
