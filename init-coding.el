;;; init-coding.el --- coding system

;;; Commentary:
;;

;;; Code:

(define-coding-system-alias 'cp65001 'utf-8)

(prefer-coding-system 'utf-8)
(set-language-environment 'utf-8)

(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)

;; (set-default-coding-systems 'gbk)
;; (set-terminal-coding-system 'gbk)
;; (set-language-environment 'Chinese-GBK)

(provide 'init-coding)

;;; init-coding.el ends here
