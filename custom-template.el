;;; custom-template.el ---

;;; Commentary:
;; 

;;; Code:

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;; '(custom-enabled-themes (quote (light-blue)))
 '(blink-cursor-mode t)
 '(column-number-mode t)
 '(cursor-type 'box)
 '(dart-sdk-path "d:/Scoop/apps/flutter/current/bin/cache/dart-sdk/")
 ;;; FIX find-dired.elc freeze on windows(CMD: gfind NUL -ls)
 '(find-ls-option '("-exec ls -ld {} \";\"" . "-ld"))
 '(flutter-sdk-path "d:/Scoop/apps/flutter/current/")
 '(gc-cons-threshold 3200000)
 '(global-display-line-numbers-mode t)
 '(httpd-host "0.0.0.0")
 '(httpd-port 2020)
 '(indent-tabs-mode nil)
 '(indicate-empty-lines t)
 '(minimap-window-location (quote right))
 '(org-directory "E:/OneDrive/org")
 ;; '(org-directory (expand-file-name "E:/OneDrive/org"))
 '(select-enable-clipboard t)
 '(semantic-idle-scheduler-idle-time 5)
 '(semantic-symref-tool (quote global))
 '(size-indication-mode t)
 '(speedbar-show-unknown-files t)
 '(visual-line-mode nil t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Consolas" :foundry "outline" :slant normal :weight normal :height 105 :width normal))))
 )


(provide 'custom-template)

;;; custom-template.el ends here
