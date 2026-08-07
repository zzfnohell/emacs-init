;;; init-lsp.el --- LSP / Eglot -*- lexical-binding: t; -*-

;;; Commentary:
;; Prefer Eglot (built-in) as the LSP *client*. Start with `M-x eglot'
;; (no automatic `eglot-ensure' hooks — language layers stay free to
;; use Tide / Merlin / etc. without fighting a global LSP client).
;;
;; lsp-mode and its UI/lang packages stay `:disabled' so they do not
;; fight Eglot. Debugging lives in `init-dap.el'; dap-mode still pulls
;; lsp-mode as a *library* — that is OK and intentional.
;;
;; Do not re-add lsp-ivy: minibuffer stack is vertico/consult (see
;; init-minibuffer.el). Workspace symbols: consult / eglot APIs.
;;
;; Keymap note: `C-c a' is `ai-code-menu' (init-ai.el). Eglot keys use
;; the `C-c e' prefix. Avoid `C-c C-c' (claimed by many major modes).

;;; Code:


;;; Disabled lsp-mode stack (enable together if switching off Eglot)

(use-package lsp-mode
  :disabled
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

;; LSP UI tools (lsp-mode stack only; keep disabled with lsp-mode)
(use-package lsp-ui
  :disabled
  :ensure t
  :commands lsp-ui-mode)

(use-package lsp-haskell
  :disabled
  :after haskell-mode
  :ensure t
  :hook ((haskell-mode . lsp)
         (haskell-literate-mode . lsp)))

;; Keep disabled with lsp-mode; enable together when using the lsp-mode stack.
(use-package lsp-java
  :disabled
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
  :disabled
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


;;; Eglot (active LSP client)

(defun init-lsp/js-server-contact (_interactive)
  "LSP contact for JS buffers: Flow when `.flowconfig' exists, else tsserver.
_INTERACTIVE is non-nil when `eglot' was called interactively.
Does not cover TS/TSX — leave those on Eglot's typescript-language-server
default (and Tide in `init-web.el')."
  (if (and (executable-find "flow")
           (locate-dominating-file default-directory ".flowconfig"))
      '("flow" "lsp")
    '("typescript-language-server" "--stdio")))

(use-package eglot
  :ensure nil
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
