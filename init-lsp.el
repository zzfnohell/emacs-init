;;; init-lsp.el --- LSP / Eglot -*- lexical-binding: t; -*-

;;; Commentary:
;; lsp-mode is the default LSP *client* (auto via `lsp-deferred' hooks on
;; a set of major modes). Eglot (built-in) stays `:disabled' so the two
;; clients do not fight.
;;
;; Debugging lives in `init-dap.el'; dap-mode still pulls lsp-mode as a
;; library — that is OK and intentional.
;;
;; Do not re-add lsp-ivy: minibuffer stack is vertico/consult (see
;; init-minibuffer.el). Workspace symbols: consult / lsp APIs.
;;
;; Keymap note: `C-c a' is `ai-code-menu' (init-ai.el). lsp-mode keys use
;; its default bindings (C-c l ...). Avoid `C-c C-c' (claimed by many
;; major modes).

;;; Code:


;;; lsp-mode stack (default LSP client)

(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :hook ((java-mode . lsp-deferred)
         (java-ts-mode . lsp-deferred)
         (python-mode . lsp-deferred)
         (python-ts-mode . lsp-deferred)
         (haskell-mode . lsp-deferred)
         (haskell-literate-mode . lsp-deferred)
         (latex-mode . lsp-deferred)
         (tex-mode . lsp-deferred)
         (yatex-mode . lsp-deferred)
         (bibtex-mode . lsp-deferred)
         (js-mode . lsp-deferred)
         (js-ts-mode . lsp-deferred)
         (js2-mode . lsp-deferred)
         (rjsx-mode . lsp-deferred)
         (typescript-mode . lsp-deferred)
         (typescript-ts-mode . lsp-deferred)
         (tsx-ts-mode . lsp-deferred)
         (lsp-mode . lsp-enable-which-key-integration))
  :custom
  (lsp-completion-enable t)
  (lsp-completion-provider :capf)
  (lsp-enable-snippet t)
  :config
  (require 'lsp-flow))

;; LSP UI tools (lsp-mode stack)
(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

(use-package lsp-haskell
  :after haskell-mode
  :ensure t
  :hook ((haskell-mode . lsp)
         (haskell-literate-mode . lsp)))

;; Enable with the lsp-mode stack.
(use-package lsp-java
  :ensure t
  :defer t
  :after (lsp-mode dap-mode)
  :hook ((java-mode . lsp)
         (java-ts-mode . lsp))
  :config
  (require 'dap-java)
  (require 'lsp-java-boot)
  (add-hook 'lsp-mode-hook #'lsp-lens-mode)
  (add-hook 'java-mode-hook #'lsp-java-lens-mode)
  (add-hook 'java-ts-mode-hook #'lsp-java-lens-mode))

(use-package lsp-julia
  :ensure t
  :after (:all julia-mode lsp-mode)
  :hook ((julia-mode . lsp)
         (julia-ts-mode . lsp)))


;;; which-key (built-in on Emacs 30+)

;; Built-in since Emacs 30 (this config requires >= 30.1). Lightweight;
;; enable eagerly so prefix help works with Eglot / dap hydras.
(use-package which-key
  :ensure nil
  :demand t
  :custom
  (which-key-idle-delay 0.4)
  :config
  (which-key-mode 1))


;;; Eglot (disabled; lsp-mode is the default client)

(defun init-lsp/js-server-contact (_interactive)
  "LSP contact for JS buffers: Flow when `.flowconfig' exists, else tsserver.
Only relevant for the (disabled) Eglot client."
  (if (and (executable-find "flow")
           (locate-dominating-file default-directory ".flowconfig"))
      '("flow" "lsp")
    '("typescript-language-server" "--stdio")))

(use-package eglot
  :ensure nil
  :disabled
  :defer t
  :commands (eglot eglot-ensure)
  :bind (:map eglot-mode-map
              ("C-c e r" . eglot-rename)
              ("C-c e a" . eglot-code-actions)
              ("C-c e f" . eglot-format)
              ("C-c e F" . eglot-format-buffer)
              ("C-c e i" . eglot-code-action-organize-imports)
              ("C-c e R" . eglot-reconnect)
              ("C-c e q" . eglot-shutdown)
              ("C-c e h" . eldoc))
  :custom
  (eglot-autoshutdown t)
  (eglot-extend-to-xref t)
  (eglot-send-changes-idle-time 0.5)
  :config
  ;; Only JS / rjsx: prefer Flow inside Flow projects; never steal TS/TSX.
  (add-to-list 'eglot-server-programs
               `((js-mode js-ts-mode rjsx-mode)
                 . ,#'init-lsp/js-server-contact)))


;;; Navigation helpers shared with LSP backends

(use-package xref
  :ensure nil
  :defer t
  :commands (xref-find-definitions
             xref-find-references)
  :bind (("s-r" . xref-find-references)
         ("s-[" . xref-go-back)
         ("C-<down-mouse-2>" . xref-go-back)
         ("s-]" . xref-go-forward)))

(use-package eldoc
  :ensure nil
  :bind ("s-d" . eldoc)
  :custom
  (eldoc-echo-area-prefer-doc-buffer t))

(message "[init] init-lsp loaded")

(provide 'init-lsp)

;;; init-lsp.el ends here
