;;; init-coding.el --- coding system

;;; Commentary:
;;

;;; Code:

(cond
 ((or (cygwin-p) (windows-p))
  (progn
	(set-language-environment 'Chinese-GBK)
	(setq locale-coding-system 'gbk)
	(set-default-coding-systems 'gbk)
	(set-terminal-coding-system 'gbk)
	(unless (eq system-type 'windows-nt)
	  (set-selection-coding-system 'utf-8))
	(prefer-coding-system 'gbk)))
 (t
  ;; disable CJK coding/encoding (Chinese/Japanese/Korean characters)
  (setq utf-translate-cjk-mode nil) 
  (set-language-environment 'utf-8)
  ;; For old Carbon emacs on OS X only
  (set-keyboard-coding-system 'utf-8) 
  (setq locale-coding-system 'utf-8)
  (set-default-coding-systems 'utf-8)
  (set-terminal-coding-system 'utf-8)
  (unless (eq system-type 'windows-nt)
	(set-selection-coding-system 'utf-8))
  (prefer-coding-system 'utf-8)))

(provide 'init-coding)

;;; init-coding.el ends here
