;;; init-coding-system.el --- coding system

;;; Commentary:
;;

;;; Code:

(define-coding-system-alias 'cp65001 'utf-8)

(prefer-coding-system 'utf-8)

(when (eq system-type 'windows-nt)
  (setenv "LC_TIME" "zh_CN.UTF-8")
  (setq system-time-locale "C")
  (set-language-environment 'Chinese-GBK))

;; (set-default-coding-systems 'utf-8)
;; (set-terminal-coding-system 'utf-8)
;; (set-keyboard-coding-system 'utf-8)
;; (set-selection-coding-system 'utf-8)
;; (set-buffer-file-coding-system 'utf-8)
;; (set-file-name-coding-system 'utf-8)
;; (modify-coding-system-alist 'process "*" 'utf-8)
;; (set-buffer-process-coding-system 'utf-8 'utf-8)

;; (set-default-coding-systems 'gbk)
;; (set-terminal-coding-system 'gbk)
;; (set-terminal-coding-system 'gbk)
;; (set-keyboard-coding-system 'gbk)
;; (set-selection-coding-system 'gbk)
;; (set-buffer-file-coding-system 'gbk)
;; (set-file-name-coding-system 'gbk)
;; (modify-coding-system-alist 'process "*" 'gbk)
;; (set-buffer-process-coding-system 'gbk 'gbk)

(provide 'init-coding-system)

;;; init-coding-system.el ends here
