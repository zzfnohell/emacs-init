;;; init-coding.el --- coding system

;;; Commentary:
;;

;;; Code:

;; disable CJK coding/encoding (Chinese/Japanese/Korean characters)
(setq utf-translate-cjk-mode nil) 
(set-language-environment 'utf-8)
;; (set-language-environment 'Chinese-GBK)

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)

;; (set-default-coding-systems 'gbk)
;; (set-terminal-coding-system 'gbk)


(unless (eq system-type 'windows-nt)
	(set-selection-coding-system 'utf-8))

(provide 'init-coding)

;;; init-coding.el ends here
