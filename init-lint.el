;;; init-lint.el --- Static Syntax Analysis -*- lexical-binding: t; -*-

;;; Commentary:
;; On-the-fly linting.
;;
;; - Flycheck is the default checker (`global-flycheck-mode`).
;; - Flymake remains available for Eglot (see `init-lsp.el`) and for
;;   `consult-flymake' (`M-g f` in `init-minibuffer.el`).  When Eglot
;;   manages a buffer it drives Flymake, so Flycheck is turned off there
;;   to avoid duplicate diagnostics.

;;; Code:

(use-package flycheck
  :ensure t
  :hook (after-init . global-flycheck-mode)
  :custom
  (flycheck-emacs-lisp-load-path 'inherit)
  (flycheck-display-errors-delay 0.3)
  (flycheck-idle-change-delay 1.0)
  (flycheck-indication-mode 'left-fringe)
  (flycheck-check-syntax-automatically '(save idle-change mode-enabled)))

(use-package flymake
  :ensure nil
  :defer t
  :custom
  (flymake-no-changes-timeout 1.0)
  ;; Keep Flymake fringe markers on the right so they do not collide with
  ;; Flycheck's left-fringe indicators when both briefly coexist.
  (flymake-fringe-indicator-position 'right-fringe)
  :bind (:map flymake-mode-map
              ("C-c ! n" . flymake-goto-next-error)
              ("C-c ! p" . flymake-goto-prev-error)
              ("C-c ! l" . flymake-show-buffer-diagnostics)))

(declare-function eglot-managed-p "eglot" ())

(defun init-lint/eglot-prefer-flymake ()
  "Prefer Flymake while Eglot manages the buffer; restore Flycheck after.
`eglot-managed-mode-hook' runs on both start and stop — use
`eglot-managed-p' to distinguish (see eglot.el)."
  (if (eglot-managed-p)
      (when (bound-and-true-p flycheck-mode)
        (flycheck-mode -1))
    (when (and (bound-and-true-p global-flycheck-mode)
               (not (bound-and-true-p flycheck-mode)))
      (flycheck-mode 1))))

(with-eval-after-load 'eglot
  (add-hook 'eglot-managed-mode-hook #'init-lint/eglot-prefer-flymake))

(use-package flycheck-flow
  :ensure t
  :after (flycheck flow-minor-mode)
  :config
  ;; next-checker chain (flow → eslint) is registered by flycheck-flow.el.
  (flycheck-add-mode 'javascript-flow 'flow-minor-mode)
  (flycheck-add-mode 'javascript-eslint 'flow-minor-mode))

(use-package flycheck-plantuml
  :ensure t
  :defer t
  :commands flycheck-plantuml-setup
  :hook (plantuml-mode . flycheck-plantuml-setup))

(message "[init] init-lint loaded")

(provide 'init-lint)

;;; init-lint.el ends here
