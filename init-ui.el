;;; init-ui.el --- UI

;;; Commentary:
;; 

;;; Code:

(print "Configuring UI")

(defun set-font (name size)
  "Set font to NAME and SIZE."
  (let ((style (format "%s %d" name size)))
    ;; (add-to-list 'default-frame-alist '(font . style))
    (set-frame-font style)
    ;;Setting English Font
    (set-face-attribute 'default nil :font style)
    ;; Chinese Font
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
      (set-fontset-font
       (frame-parameter nil 'font)
       charset
       (font-spec :family name :size size)))))

(if (not (eq nil window-system))
    (cond ((eq 'darwin system-type) (set-font "Monaco" 10))
          ((eq 'gnu/linux system-type) (set-font "Monaco" 10))
          (t (set-font "Ubuntu Mono" 10))))

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

(setq-default indent-tabs-mode nil)

;; (defface egoge-display-time
;;    '((((type x w32 mac))
;;       ;; #060525 is the background colour of my default face.
;;       (:foreground "#060525" :inherit bold))
;;      (((type tty))
;;       (:foreground "blue")))
;;    "Face used to display the time in the mode line.")

;; (defvar display-time-string-forms
;; 	  '((propertize
;; 		 (concat " "
;; 				 year
;; 				 "-"
;; 				 (format "%02d" (string-to-number month 10))
;; 				 "-"
;; 				 (format "%02d" (string-to-number day 10))
;; 				 "."
;; 				 (format "%02d" (string-to-number 24-hours 10))
;; 				 ":"
;; 				 (format "%02d" (string-to-number minutes 10))
;; 				 " ")
;; 		 'face
;;          'egoge-display-time)))

;; ;; display date time,format as below:
;; (display-time-mode 1)

;; (setq display-time-day-and-date t)




(when window-system
  (scroll-bar-mode -1)
  (tool-bar-mode -1))

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

(use-package minimap
  :ensure t
  :defer t
  :custom (minimap-window-location (quote right))
	)

;; (use-package sr-speedbar)

(provide 'init-ui)

;;; init-ui.el ends here

