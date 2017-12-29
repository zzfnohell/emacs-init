;;; init-company.el --- company


;;; Commentary:
;; 

;;; Code:

(use-package company
  :defer t
  :init
  (after-load 'company
    (add-hook 'prog-mode-hook 'enable-company-mode)
    (add-hook 'enh-ruby-mode-hook 'enable-company-mode)

    (setq
     ;; never start auto-completion unless I ask for it
     company-idle-delay nil
     ;; autocomplete right after '.'
     company-minimum-prefix-length 0
     ;; remove echo delay
     company-echo-delay 0
     ;; don't complete in certain modes
     company-global-modes '(not git-commit-mode)
     ;; make sure evil uses the right completion functions
     evil-complete-next-func 'company-complete-lambda
     evil-complete-previous-func 'company-complete-lambda))

  :config
  (progn
    (defun company-complete-lambda (arg)
      "Ignores passed in arg like a lambda and runs company-complete"
      (company-complete))

    (defun enable-company-mode ()
      "Enables company-mode"
      (company-mode 1)
      ;; Make sure emacs does the right thing with completion command
      (define-key (current-local-map) [remap hippie-expand] 'company-complete))

    ;; shorten company lighter
    (setq company-default-lighter " com")
    (setq company-tooltip-align-annotations t)
    (autoload 'company-mode "company" nil t)
    (add-hook 'after-init-hook 'global-company-mode)))


(use-package company-jedi
  :defer t
  :config (add-to-list 'company-backends 'company-jedi))

(use-package company-coq :defer t)
(use-package company-c-headers
  :defer t
  :config (add-to-list 'company-backends 'company-c-headers))

(use-package company-tern
  :defer t
  :config
  (progn
    (add-to-list 'company-backends 'company-tern)
    (setq company-tern-property-marker "")
    (setq company-tern-meta-as-single-line t)))

(use-package company-quickhelp
  :defer t
  :config (company-quickhelp-mode 1))

(use-package company-math
  :defer t
  :config (add-to-list 'company-backends 'company-math-symbols-unicode))

(use-package company-inf-ruby
  :defer t
  :config (add-to-list 'company-backends 'company-inf-ruby))

(req-package company-lua
	:defer t)

(use-package company-glsl
  :config
  (when (executable-find "glslangValidator")
    (add-to-list 'company-backends 'company-glsl)))

(provide 'init-company)

;;; init-company.el ends here
