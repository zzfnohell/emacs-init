;;; init-ui.el --- UI

;;; Commentary:
;; 

;;; Code:

(print "Configuring UI")

(cond
 ((not (eq nil window-system))
  (setq default-frame-alist
        (append '((font . "Ubuntu Mono 11")) default-frame-alist))
  (set-frame-font "Ubuntu Mono 11")
  (set-default-font "Ubuntu Mono 11")
  ;;Setting English Font
  (set-face-attribute 'default nil :font "Ubuntu Mono 11")
  ;; Chinese Font
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font
     (frame-parameter nil 'font)
     charset
     (font-spec :family "Ubuntu Mono" :size 11)))))

(setq ansi-color-for-comint-mode t) ;emacs shell font confusion

(setq inhibit-startup-message t);close startup slash
(setq visible-bell t);close close-bell
(setq make-backup-files nil);do not create backup files
(global-font-lock-mode t);semantic highlight
(auto-image-file-mode t);open picture display.
(fset 'yes-or-no-p 'y-or-n-p);use y/n replace yes/no
(column-number-mode t);display column number
(show-paren-mode t) ;match parentheses.
;; (setq-default cursor-type 'box)
(setq-default indent-tabs-mode nil)

(defface egoge-display-time
   '((((type x w32 mac))
      ;; #060525 is the background colour of my default face.
      (:foreground "#060525" :inherit bold))
     (((type tty))
      (:foreground "blue")))
   "Face used to display the time in the mode line.")

(setq display-time-string-forms
	  '((propertize
		 (concat " "
				 year
				 "-"
				 (format "%02d" (string-to-number month 10))
				 "-"
				 (format "%02d" (string-to-number day 10))
				 "."
				 (format "%02d" (string-to-number 24-hours 10))
				 ":"
				 (format "%02d" (string-to-number minutes 10))
				 " ")
		 'face 'egoge-display-time)))


(display-time-mode 1);display date time,format as below:
(setq display-time-day-and-date t)

(tool-bar-mode -1)

(transient-mark-mode t)
;;enable clipboard.
(setq x-select-enable-clipboard t)
;; display buffer name on the caption.
(setq frame-title-format
      (list
       '(:eval (buffer-name (current-buffer)))
       "  @emacs-zzfnohell" ))

(setq-default truncate-lines nil)
(setq-default global-visual-line-mode t)

(defun set-transparency (alpha-level)
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

(require-package 'minimap)

(provide 'init-ui)

;;; init-ui.el ends here
