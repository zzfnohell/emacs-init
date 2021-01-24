;;; init-edit.el --- Edit Config

;;; Commentary:
;;

;;; Code:

;; Access via Web
;; (use-package take-off )

;; emacs shell font confusion
(defvar ansi-color-for-comint-mode t)

;; close startup slash
(setq inhibit-startup-message t)

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

;; (defface egoge-display-time
;;    '((((type x w32 mac))
;;       ;; #060525 is the background colour of my default face.
;;       (:foreground "#060525" :inherit bold))
;;      (((type tty))
;;       (:foreground "blue")))
;;    "Face used to display the time in the mode line.")

;; (defvar display-time-string-forms
;;    '((propertize
;;     (concat " "
;;         year
;;         "-"
;;         (format "%02d" (string-to-number month 10))
;;         "-"
;;         (format "%02d" (string-to-number day 10))
;;         "."
;;         (format "%02d" (string-to-number 24-hours 10))
;;         ":"
;;         (format "%02d" (string-to-number minutes 10))
;;         " ")
;;     'face
;;          'egoge-display-time)))

;; ;; display date time,format as below:
;; (display-time-mode 1)

;; (setq display-time-day-and-date t)


(when window-system
  (scroll-bar-mode -1))

(transient-mark-mode t)

;; display buffer name on the caption.
(setq frame-title-format
      (list
       '(:eval (buffer-name (current-buffer)))))

(setq-default truncate-lines nil)
(setq-default global-visual-line-mode t)

(use-package fuzzy
  :ensure t
  :demand t)

(require 'hl-line)

(use-package hl-anything
  :ensure t
  :demand t)

(use-package hl-indent
  :ensure t
  :demand t)

(use-package highlight-parentheses
  :ensure t
  :demand t)

(use-package highlight-thing
  :ensure t
  :demand t)

(use-package auto-highlight-symbol
  :ensure t
  :demand t
  :config
  (global-auto-highlight-symbol-mode t))

(use-package undo-tree
  :ensure t
  :demand t
  :config
  (global-undo-tree-mode))

(add-hook 'texinfo-mode-hook (lambda () (require 'sb-texinfo)))

(use-package anyins
  :ensure t
  :demand t)

(use-package popup-kill-ring
  :ensure t
  :demand t)

(use-package kill-ring-search
  :ensure t
  :demand t)

(setq abbrev-file-name "~/.emacs.d/abbrev_defs")
(setq-default abbrev-mode t)
(if (file-exists-p abbrev-file-name)
    (quietly-read-abbrev-file))
(setq save-abbrevs t)
(xterm-mouse-mode 1)

(global-display-line-numbers-mode)

(require 'speedbar)

(use-package memory-usage
  :ensure t
  :demand t)

(use-package winum
  :ensure t
  :demand t
  :config
  (winum-mode))


(use-package backward-forward
  :demand
  :config
  (backward-forward-mode t)
  :bind (:map backward-forward-mode-map
              ("<C-left>" . nil)
              ("<C-right>" . nil)
              ("<M-left>" . backward-forward-previous-location)
              ("<M-right>" . backward-forward-next-location)))

(use-package visible-mark
  :ensure t
  :demand t
  :config
  (setq visible-mark-max 2)

  (defface init-ui/visible-mark-face-2
    `((t (:background "orange" :foreground "black")))
    "Face for the mark."
    :group 'visible-mark)
  
  (setq visible-mark-faces `(visible-mark-face init-ui/visible-mark-face-2))
  (global-visible-mark-mode +1))

(use-package projectile
  :ensure t
  :demand t
  :config
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

(use-package sr-speedbar
  :ensure t)

(use-package minimap
  :ensure t
  :demand t)

(use-package all-the-icons
  :ensure t
  :demand t)



;; Slow Rendering
;; If you experience a slow down in performance when rendering multiple
;; icons simultaneously, you can try setting the following variable
(setq inhibit-compacting-font-caches t)

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

(require 'display-fill-column-indicator)
(setq display-fill-column-indicator-column 120)
(defun init-ui/enable-display-fill-column ()
	(display-fill-column-indicator-mode))

(add-hook 'prog-mode-hook #'init-ui/enable-display-fill-column)

(require 'ls-lisp)

(require 'dired)
(setq dired-listing-switches "-alh")

(when (eq system-type 'windows-nt)
  (setq find-program (purecopy "gfind")))

(when (eq system-type 'darwin)
  (setq dired-use-ls-dired nil))

(when (eq system-type 'windows-nt)
  (setq w32-get-true-file-attributes nil)
  (global-auto-revert-mode -1))

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(setq ediff-split-window-function 'split-window-horizontally)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

(use-package session
  :config (add-hook 'after-init-hook 'session-initialize))

(use-package visual-regexp)
(use-package regex-tool
  :ensure t
  :demand t)

(use-package rfc-mode
  :ensure t)

(require 'tramp-gvfs)

(use-package httprepl
  :ensure t
  :demand t)

(use-package mqtt-mode
  :ensure t
  :demand t)

(use-package rg
  :ensure t
  :demand t
  :config
  (rg-enable-menu))

(use-package highlight-indent-guides
	:ensure t
	:config
	(add-hook 'prog-mode-hook 'highlight-indent-guides-mode))

(use-package graphviz-dot-mode
  :ensure t
  :demand t)

(use-package logview
  :ensure t)

(use-package vlf
  :ensure t
  :config (require 'vlf-setup))



(provide 'init-edit)
;;; init-edit.el ends here
