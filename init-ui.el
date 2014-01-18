(print "Configuring UI")

(cond
 ((not (eq nil window-system))
  (setq default-frame-alist
        (append
         '((font . "Ubuntu Mono 10")) default-frame-alist))
  (set-frame-font "Ubuntu Mono 10")
  ;;Setting English Font
  (set-face-attribute
   'default nil :font "Ubuntu Mono 10")
  
  ;; Chinese Font
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font
     (frame-parameter nil 'font)
     charset
     (font-spec :family "WenQuanYi Micro Hei Mono" :size 10)))))

(setq ansi-color-for-comint-mode t) ;emacs shell font confusion

(setq inhibit-startup-message t);close startup slash
(setq visible-bell t);close close-bell
(setq make-backup-files nil);do not create backup files
(global-font-lock-mode t);semantic highlight
(auto-image-file-mode t);open picture display.
(fset 'yes-or-no-p 'y-or-n-p);use y/n replace yes/no
(column-number-mode t);display column number
(show-paren-mode t) ;match parentheses.
(setq-default cursor-type 'bar)
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


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(tool-bar-mode nil)
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(provide 'init-ui)
