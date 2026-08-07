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

(defun init-lint/eglot-prefer-flymake ()
  "Disable Flycheck while Eglot manages the buffer (Eglot uses Flymake)."
  (when (bound-and-true-p flycheck-mode)
    (flycheck-mode -1)))

(with-eval-after-load 'eglot
  (add-hook 'eglot-managed-mode-hook #'init-lint/eglot-prefer-flymake))

(use-package flycheck-flow
  :ensure t
  :after (flycheck flow-minor-mode)
  :config
  (flycheck-add-mode 'javascript-flow 'flow-minor-mode)
  (flycheck-add-mode 'javascript-eslint 'flow-minor-mode)
  ;; Checker chain is also registered by flycheck-flow.el itself; keep an
  ;; explicit link so eslint still runs after flow when this loads first.
  (flycheck-add-next-checker 'javascript-flow 'javascript-eslint))

(use-package flycheck-plantuml
  :ensure t
  :after flycheck
  :commands flycheck-plantuml-setup
  :hook (plantuml-mode . flycheck-plantuml-setup))

(message "[init] init-lint loaded")

(provide 'init-lint)

;;; init-lint.el ends here
