;;; init-cc-mode.el --- CC mode
;;;; CC-mode  http://cc-mode.sourceforge.net/

;;; Commentary:
;; CC mode

;;; Code:

(require 'cc-mode)
(c-set-offset 'inline-open 0)
(c-set-offset 'friend '-)
(c-set-offset 'substatement-open 0)


;;indent strategy
(defun cpp-indent-or-complete ()
  (interactive)
  (if (looking-at "\\>")
      (hippie-expand nil)
    (indent-for-tab-command)))

(setq c-default-style 
      '(('c-mode . "bsd")
        ('c++-mode . "bsd")
        ('java-mode . "java")
        ('awk-mode . "awk")
        (other . "linux")))

(setq-default c-basic-offset 2
              tab-width 2
              indent-tabs-mode t)

(defun init-cc-mode/c-mode-edit-hook()
  ;; hungry-delete and auto-newline
  (c-toggle-auto-hungry-state 1)
  (define-key c-mode-base-map [(tab)] 'cpp-indent-or-complete)
  ;;preprocessors
  (setq hs-minor-mode t)
  (setq abbrev-mode t))

(add-hook 'c-mode-common-hook 'init-cc-mode/c-mode-edit-hook)

(defun init-cc-mode/company-semantic-setup ()
  (set (make-local-variable 'company-backends)
       '((company-dabbrev-code company-yasnippet)))
  )

(use-package company-c-headers
  :after (:all company)
  :config
  (add-to-list 'company-backends 'company-c-headers)
  (add-hook 'c++-mode-hook 'init-cc-mode/company-semantic-setup)
  (add-hook 'c-mode-hook 'init-cc-mode/company-semantic-setup)
  )


(use-package clang-format)

;;opencl source file.
(add-to-list 'auto-mode-alist '("\\.h$" . c-mode))

(use-package cmake-mode)

(use-package opencl-mode
  :init (add-to-list 'auto-mode-alist '("\\.cl\\'" . opencl-mode)))

(use-package shader-mode)

(use-package rtags
	:if (and (executable-find "rdm") (executable-find "rc")))

(use-package cmake-ide
	:if (featurep 'rtags)
  :config
	(require 'rtags)
  (cmake-ide-setup))

(provide 'init-cc-mode)

;;; init-cc-mode.el ends here
