;; depends on cedet.el
;;;; CC-mode  http://cc-mode.sourceforge.net/
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

(defun c-mode-edit-hook()
  (setq default-tab-width 4 indent-tabs-mode nil)
  (setq tab-width 4 indent-tabs-mode nil)
  (setq c-basic-offset 4)
  ;; hungry-delete and auto-newline
  (c-toggle-auto-hungry-state 1)
  (define-key c-mode-base-map [(tab)] 'cpp-indent-or-complete)
  ;;preprocessors
  (setq c-macro-shrink-window-flag t)
  (setq c-macro-preprocessor "cpp")
  (setq c-macro-cppflags " ")
  (setq c-macro-prompt-flag t)
  (setq hs-minor-mode t)
  (setq abbrev-mode t))

(defun c++-mode-edit-hook()
  (setq default-tab-width 4 indent-tabs-mode nil)
  (setq tab-width 4 indent-tabs-mode nil)
  (setq c-basic-offset 4)
  (c-set-style "stroustrup"))

(add-hook 'semantic-init-hooks 'cedet-semantic-hook)

(add-hook 'c-mode-common-hook
          '(lambda ()
             (gtags-mode 1)))
(add-hook 'c-mode-common-hook 'cedet-semantic-hook)
(add-hook 'c-mode-common-hook 'c-mode-cedet-hook)
(add-hook 'c-mode-common-hook 'c-mode-edit-hook)
(add-hook 'c-mode-common-hook (lambda() (c-set-style "k&r")))
(add-hook 'c-mode-common-hook 'c-toggle-hungry-state)
(add-hook 'c-mode-common-hook 'hs-minor-mode)
;(add-hook 'c-mode-common-hook 'doxymacs-mode) ;; init doxymacs-mode

(add-hook 'c++-mode-hook 'c++-mode-edit-hook)
(add-hook 'c++-mode-common-hook (lambda() (c-set-style "k&r")))
;(add-hook 'c++-mode-common-hook 'doxymacs-mode) ;;init doxymacs-mode

(setq auto-mode-alist
      (append '(("\\.h$" . c-mode)) auto-mode-alist))

;;opencl source file.
(setq auto-mode-alist (cons '("\\.cl$" . c-mode) auto-mode-alist))

(provide 'init-cc-mode)
