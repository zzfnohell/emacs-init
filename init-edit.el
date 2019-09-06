;;; init-edit.el --- Edit Config

;;; Commentary:
;;

;;; Code:

;; Access via Web
;; (use-package take-off )

(defconst *font-list* (list
                       "Sarasa Term SC"
                       "Roboto Mono"
                       "Ubuntu Mono"
                       "Source Code Pro"
                       "DejaVu Sans Mono"
                       "Monaco")
  "Favored font list.")

(defun init-edit/set-font (name size)
  "Set default font by NAME and SIZE."
  (let ((s (format "%s-%d" name size)))
    (add-to-list 'default-frame-alist `(font . ,s))))

(defun init-edit/select-font ()
  "Select available font."
  (let* ((found nil)
         (names *font-list*)
  		 (name nil))
    (while (and (not found) names)
	  (setq name (car names))
	  (when (and name (font-info name))
	     (init-edit/set-font name 12)
		 (setq found t))
	  (setq names (cdr names)))))

(when window-system (init-edit/select-font))

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

;; (setq-default cursor-type 'box)

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
  (scroll-bar-mode -1)
  )

(transient-mark-mode t)

;;enable clipboard.
(setq x-select-enable-clipboard t)

;; display buffer name on the caption.
(setq frame-title-format
      (list
       '(:eval (buffer-name (current-buffer)))))

(setq-default truncate-lines nil)
(setq-default global-visual-line-mode t)

(defun set-transparency (alpha-level)
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

(use-package sr-speedbar)

(use-package minimap)

(use-package window-number
  :config
  ;; (window-number-mode 1)
  (window-number-meta-mode)
  )

(use-package minimap)

(use-package auto-indent-mode
  :custom
  (auto-indent-known-indent-level-variables
   '(c-basic-offset lisp-body-indent sgml-basic-offset))
  :config (auto-indent-global-mode))

(use-package hl-line :ensure nil)

(use-package hl-anything)

(use-package hl-indent)

(use-package highlight-parentheses)

(use-package highlight-thing)

(use-package auto-highlight-symbol
  :config (global-auto-highlight-symbol-mode t))

(use-package undo-tree
  :config (global-undo-tree-mode))

(use-package regex-tool)

(use-package visible-mark
  :init
  (defface visible-mark-active
    ;; put this before (require 'visible-mark)
    '((((type tty) (class mono)))
      (t (:background "magenta"))) "")
  (setq visible-mark-max 2)
  (setq visible-mark-faces `(visible-mark-face1 visible-mark-face2))
  :config
  (global-visible-mark-mode 1)
  )


(add-hook 'texinfo-mode-hook (lambda () (require 'sb-texinfo)))

;; CSV file
(use-package csv-mode
  :mode "\\.[Cc][Ss][Vv]\\'"
  :init (setq csv-separators '("," ";" "|" " "))
  )


(use-package anyins)

(use-package popup-kill-ring)

(use-package kill-ring-search
  :config
  (progn
    (autoload 'kill-ring-search "kill-ring-search"
      "Search the kill ring in the minibuffer."
      (interactive))))

(setq abbrev-file-name "~/.emacs.d/abbrev_defs")
(setq-default abbrev-mode t)
(if (file-exists-p abbrev-file-name)
    (quietly-read-abbrev-file))
(setq save-abbrevs t)
(xterm-mouse-mode 1)

(use-package httprepl)

(use-package speedbar)

(use-package rg
  :config (rg-enable-default-bindings))

(use-package graphviz-dot-mode)

(global-display-line-numbers-mode)

(provide 'init-edit)
;;; init-edit.el ends here
