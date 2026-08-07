;;; init-lint.el --- Static Syntax Analysis

;;; Commentary:
;;

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
  (flycheck-add-mode 'javascript-flow 'flow-minor-mode)
  (flycheck-add-mode 'javascript-eslint 'flow-minor-mode)
  (flycheck-add-next-checker 'javascript-flow 'javascript-eslint))

(use-package flycheck-plantuml
  :ensure t
  :defer t
  :hook
  (plantuml-mode . flycheck-plantuml-setup))

(provide 'init-lint)

;;; init-lint.el ends here
