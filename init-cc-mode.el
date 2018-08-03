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

(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)

(use-package clang-format
  :defer t
	:ensure t)

;;opencl source file.
(add-to-list 'auto-mode-alist '("\\.h$" . c-mode))

(use-package cmake-mode
	:ensure t
  :defer t)
(use-package opencl-mode
	:ensure t
  :init (add-to-list 'auto-mode-alist '("\\.cl\\'" . opencl-mode))
  )

(use-package shader-mode
	:ensure t
  :defer t)


(use-package cmake-ide
  :ensure t
  :defer t
  :config
  (cmake-ide-setup)
  )
  
(provide 'init-cc-mode)

;;; init-cc-mode.el ends here
