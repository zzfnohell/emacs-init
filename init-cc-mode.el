;;; init-cc-mode.el --- CC mode
;; depends on cedet.el
;;;; CC-mode  http://cc-mode.sourceforge.net/

;;; Commentary:
;; CC mode

;;; Code:

(require-package 'diminish)
(require 'cc-mode)
(c-set-offset 'inline-open 0)
(c-set-offset 'friend '-)
(c-set-offset 'substatement-open 0)

(defun c-mode-cedet-hook ()
       (local-set-key "." 'semantic-complete-self-insert)
       (local-set-key ">" 'semantic-complete-self-insert)
       (local-set-key "\C-c \C-r" 'semantic-symref))

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

(setq-default c-basic-offset 4
              tab-width 4
              indent-tabs-mode t)

(defun c-mode-edit-hook()
  ;; hungry-delete and auto-newline
  (c-toggle-auto-hungry-state 1)
  (define-key c-mode-base-map [(tab)] 'cpp-indent-or-complete)
  ;;preprocessors
  (setq hs-minor-mode t)
  (setq abbrev-mode t))

(add-hook 'c-mode-common-hook 'cedet-semantic-hook)
(add-hook 'c-mode-common-hook 'c-mode-cedet-hook)
(add-hook 'c-mode-common-hook 'c-mode-edit-hook)
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)

;(add-hook 'c-mode-common-hook 'doxymacs-mode) ;; init doxymacs-mode
;(add-hook 'c++-mode-common-hook 'doxymacs-mode) ;;init doxymacs-mode

(require-package 'clang-format)
(require 'clang-format)

(require-package 'ac-clang)
(require 'ac-clang)
;; (ac-clang-initialize)

;;opencl source file.
(add-to-list 'auto-mode-alist '("\\.h$" . c-mode))

(require-package 'cmake-mode)

(require-package 'opencl-mode)
(require 'opencl-mode)
(add-to-list 'auto-mode-alist '("\\.cl\\'" . opencl-mode))

(require-package 'shader-mode)

(provide 'init-cc-mode)

;;; init-cc-mode.el ends here
