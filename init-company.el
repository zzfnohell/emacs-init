;;; init-company.el --- company


;;; Commentary:
;; 

;;; Code:
(require-package 'company)
(require 'company)
(autoload 'company-mode "company" nil t)
(add-hook 'after-init-hook 'global-company-mode)

(require-package 'company-jedi)

(require-package 'company-coq)

(require-package 'company-c-headers)

(require-package 'company-tern)
(setq company-tern-property-marker "")
(setq company-tern-meta-as-single-line t)

(setq company-tooltip-align-annotations t)

(require-package 'company-quickhelp)
(company-quickhelp-mode 1)

(require-package 'company-math)

(require-package 'company-inf-ruby)

(defun add-to-company-backend-list ()
  (progn
    (add-to-list 'company-backends 'company-inf-ruby)
    (add-to-list 'company-backends 'company-math-symbols-unicode)
    (add-to-list 'company-backends 'company-tern)
    (add-to-list 'company-backends 'company-c-headers)
    (add-to-list 'company-backends 'company-jedi)))

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

(eval-after-load 'company '(add-to-company-backend-list))
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


;;; company-go - company backend for Golang
;;; https://github.com/nsf/gocode/blob/master/emacs-company/company-go.el
(require-package 'company-go)
(after-load 'go-mode
  (defun setup-company-go ()
    "Hook for running on company-go"
    ;; we only want to use company-go - it's so accurate we won't need any other
    ;; completion engines
    (set (make-local-variable 'company-backends) '(company-go)))

  (after-load 'company-go
    (defadvice company-go (around fix-company-go-prefix activate)
      "Clobber company-go to use company-grab-word instead of the
flakey regular expression. This allows us to complete standard
variables etc. as well as methods and properties."
      ad-do-it
      (when (eql (ad-get-arg 0) 'prefix)
        (setq ad-return-value (company-grab-word))))

    (add-hook 'go-mode-hook 'setup-company-go))

  (require 'company-go))

(provide 'init-company)

;;; init-company.el ends here
