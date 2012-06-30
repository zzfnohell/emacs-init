(load "~/.emacs.d/config/parameters.el")


(cond
 ((cygwin-p)  
  ;;font configuration
  (progn
    (set-language-environment 'Chinese-GB)
    (set-locale-environment "GBK")))
 (t
  (progn
    (set-language-environment 'UTF-8)
    (set-locale-environment "UTF-8"))))

(if (window-system)
    (progn
      (setq default-frame-alist
	    (append
	     '((font . "WenQuanYi Micro Hei Mono 10")) default-frame-alist))
      (set-default-font "WenQuanYi Micro Hei Mono 10")
      ;; Setting English Font
      (set-face-attribute
       'default nil :font "WenQuanYi Micro Hei Mono 10")
      ;; Chinese Font
      (dolist (charset '(kana han symbol cjk-misc bopomofo))
	(set-fontset-font
	 (frame-parameter nil 'font)
	 charset
	 (font-spec :family "WenQuanYi Micro Hei Mono" :size 12)))
      ;; remove tool bar.
      (tool-bar-mode nil)
      ;; keep the scroll bar.
      (scroll-bar-mode t)))

;; UI configuration
(menu-bar-mode nil) ;remove menu bar.

;emacs shell font confusion
(setq ansi-color-for-comint-mode t)

(setq inhibit-startup-message t);close startup slash
(setq visible-bell t);close close-bell
(setq make-backup-files nil);do not create backup files
(global-font-lock-mode t);semantic highlight
(auto-image-file-mode t);open picture display.
(fset 'yes-or-no-p 'y-or-n-p);use y/n replace yes/no
(column-number-mode t);display column number
(show-paren-mode t) ;match parentheses.
(display-time-mode 1);display date time,format as below:
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)

(transient-mark-mode t)
;;enable clipboard.
(setq x-select-enable-clipboard t)
;; display buffer name on the caption.
(setq frame-title-format
      (list
       '(:eval (buffer-name (current-buffer)))
       "  @emacs-zzfnohell" ))

(defun kill-buffer-on-exit (process state)
  (message "%s" state)
  (if (or
       (string-match "exited abnormally with code.*" state)
       (string-match "finished" state))
      (kill-buffer (current-buffer))))
