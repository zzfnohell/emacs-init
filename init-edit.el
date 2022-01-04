;;; init-edit.el --- edit -*- lexical-binding: t -*-

;;; Commentary:
;;

;;; Code:

;; Access via Web
;; (use-package take-off )

;; emacs shell font confusion
(defvar ansi-color-for-comint-mode t)

;; close startup slash
;; (setq inhibit-startup-message t)

;; close close-bell
(setq visible-bell t)

;; do not create backup files
(setq make-backup-files nil)

;; semantic highlight
(global-font-lock-mode t)

;; open picture display.
(auto-image-file-mode t)

;; use y/n replace yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; display column number
(column-number-mode t)

;; match parentheses.
(show-paren-mode t)

(blink-cursor-mode t)

(size-indication-mode 1)

(when (window-system)
  (scroll-bar-mode -1))

;; display buffer name on the caption.
(setq frame-title-format
      (list
       '(:eval (buffer-name (current-buffer)))))

;;; Indent
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)

;; http://xahlee.info/emacs/emacs/emacs_tabs_space_indentation_setup.html
;; make tab key always call a indent command.
;; (setq-default tab-always-indent t)

;; make tab key call indent command or insert tab character, depending on cursor position
;; (setq-default tab-always-indent nil)

;; make tab key do indent first then completion.
(setq-default tab-always-indent 'complete)


;;; Line
(setq-default truncate-lines nil)
(setq-default global-visual-line-mode t)

(use-package undo-tree
  :ensure t
  :config
  (global-undo-tree-mode))

(add-hook 'texinfo-mode-hook (lambda () (require 'sb-texinfo)))

(use-package anyins
  :ensure t)

(use-package popup-kill-ring
  :ensure t)

(use-package kill-ring-search
  :ensure t)

(global-display-line-numbers-mode)

(use-package backward-forward
  :config
  (backward-forward-mode t)
  :bind (:map backward-forward-mode-map
              ("<C-left>" . nil)
              ("<C-right>" . nil)
              ("<M-left>" . backward-forward-previous-location)
              ("<M-right>" . backward-forward-next-location)))

;;; UI transparency
(defun ui-set-transparency (alpha-level)
  "Set transparency as ALPHA-LEVEL."
  (interactive "p")
  (message (format "Alpha level passed in: %s" alpha-level))
  (let ((alpha-level
         (if (< alpha-level 2)
             (read-number "Opacity percentage: " 85)
           alpha-level))
        (myalpha (frame-parameter nil 'alpha)))
    (set-frame-parameter nil 'alpha alpha-level))
  (message (format "Alpha level is %d" (frame-parameter nil 'alpha))))

;;(set-frame-parameter (selected-frame) 'alpha '(85 50))
;;(add-to-list 'default-frame-alist '(alpha 85 50))

(use-package multiple-cursors
	:ensure t
	:bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this)
         ("C-S-<mouse-1>" . mc/add-cursor-on-click)))

(use-package so-long
  :ensure t
  :config
  (global-so-long-mode 1))

(message "loading init-edit done.")

(provide 'init-edit)
;;; init-edit.el ends here
