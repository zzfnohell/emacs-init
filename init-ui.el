(print "Configuring UI")

(cond
 ((not (eq nil window-system))
  (setq default-frame-alist
        (append '((font . "Ubuntu Mono 11")) default-frame-alist))
  (set-frame-font "Ubuntu Mono 11")
  ;;Setting English Font
  (set-face-attribute 'default nil :font "Ubuntu Mono 11")
  ;; Chinese Font
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font
     (frame-parameter nil 'font)
     charset
     (font-spec :family "WenQuanYi Micro Hei Mono" :size 11)))))

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

(setq-default truncate-lines t)
(setq-default global-visual-line-mode t)

(require-package 'tabbar)
(require 'tabbar)
(defun customize-tabbar-buffer-groups ()
  "Return the list of group names the current buffer belongs to.
     Return a list of one element based on major mode."
  (list
   (cond
    ((or (get-buffer-process (current-buffer))
         ;; Check if the major mode derives from `comint-mode' or
         ;; `compilation-mode'.
         (tabbar-buffer-mode-derived-p
          major-mode '(comint-mode compilation-mode)))
     "Process")
    ;; ((member (buffer-name)
    ;;          '("*scratch*" "*Messages*" "*Help*"))
    ;;  "Common"
    ;;  )
    ((string-equal "*" (substring (buffer-name) 0 1))
     "Common")
    ((member (buffer-name)
             '("xyz" "day" "m3" "abi" "for" "nws" "eng" "f_g" "tim" "tmp"))
     "Main")
    ((eq major-mode 'dired-mode)
     "Dired")
    ((memq major-mode
           '(help-mode apropos-mode Info-mode Man-mode))
     "Common")
     ((memq major-mode
            '(rmail-mode
              rmail-edit-mode vm-summary-mode vm-mode mail-mode
              mh-letter-mode mh-show-mode mh-folder-mode
              gnus-summary-mode message-mode gnus-group-mode
              gnus-article-mode score-mode gnus-browse-killed-mode))
      "Mail")
     (t
      ;; Return `mode-name' if not blank, `major-mode' otherwise.
      (if (and (stringp mode-name)
               ;; Take care of preserving the match-data because this
               ;; function is called when updating the header line.
               (save-match-data (string-match "[^ ]" mode-name)))
          mode-name
        (symbol-name major-mode))))))

(setq tabbar-buffer-groups-function 'customize-tabbar-buffer-groups)

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
