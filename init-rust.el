;;; init-rust.el --- Rust -*- lexical-binding: t; -*-

;;; Commentary:
;; Prefer `rust-mode' with treesitter derivation (Emacs 29.1+) so Cargo /
;; rustfmt commands stay on `rust-mode-map' while highlighting comes from
;; `rust-ts-mode'.  Do not also remap `rust-mode' → `rust-ts-mode' in
;; `init-prog.el' — that would drop those bindings.
;;
;; IDE features (completion, goto-def): use Eglot (`M-x eglot'); racer is
;; obsolete and intentionally omitted.

;;; Code:

(use-package rust-mode
  :ensure t
  :init
  ;; Must be set before rust-mode loads (rust-mode README: tree-sitter).
  (setq rust-mode-treesitter-derive t)
  :mode ("\\.rs\\'" . rust-mode)
  :custom
  (rust-format-on-save t)
  :hook
  ;; Rust style guide: spaces, not tabs.
  (rust-mode . (lambda () (setq-local indent-tabs-mode nil))))

(use-package flycheck-rust
  :ensure t
  :after flycheck
  ;; Package README: configure on flycheck-mode-hook for Cargo projects.
  :hook (flycheck-mode . flycheck-rust-setup))

;; Built-in treesit TOML (Cargo.toml, etc.).  Prefer this over the
;; third-party `toml-mode' package so files follow toml-ts-mode like the
;; conf-toml-mode remap in init-prog.el.
(use-package toml-ts-mode
  :ensure nil
  :mode ("\\.toml\\'" . toml-ts-mode))

;; Interactive command only — there is no rust-auto-use-mode.
(use-package rust-auto-use
  :ensure t
  :after rust-mode
  :commands rust-auto-use
  :bind (:map rust-mode-map
              ("C-c C-a" . rust-auto-use)))

(use-package rust-playground
  :ensure t
  :commands rust-playground)

(message "[init] init-rust loaded")

(provide 'init-rust)

;;; init-rust.el ends here
