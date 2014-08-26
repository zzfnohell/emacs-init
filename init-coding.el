;;; init-coding.el --- coding system

;;; Commentary:
;; 

;;; Code:

(cond
 ((or
   (eq system-type 'cygwin)
   (eq system-type 'windows-nt))
  (prefer-coding-system 'gbk))
 (t
  (prefer-coding-system 'utf-8)))

(provide 'init-coding)

;;; init-coding.el ends here
