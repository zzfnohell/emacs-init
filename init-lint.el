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
  :defer t
  :commands (flycheck-mode global-flycheck-mode)
  ;; Idle so flycheck is off the critical init path; still enables almost
  ;; immediately once Emacs is interactive (batch benchmarks skip idle).
  :init
  (add-hook 'emacs-startup-hook
            (lambda ()
              (run-with-idle-timer 0.05 nil #'global-flycheck-mode))))

(use-package flycheck-flow
  :ensure t
  :defer t
  :after flycheck
  :config
  ;; next-checker chain (flow → eslint) is registered by flycheck-flow.el.
  (flycheck-add-mode 'javascript-flow 'flow-minor-mode)
  (flycheck-add-mode 'javascript-eslint 'flow-minor-mode)
  (flycheck-add-next-checker 'javascript-flow 'javascript-eslint))

(use-package flycheck-plantuml
  :ensure t
  :defer t
  :commands flycheck-plantuml-setup
  :hook (plantuml-mode . flycheck-plantuml-setup))

(message "[init] init-lint loaded")

(provide 'init-lint)

;;; init-lint.el ends here
