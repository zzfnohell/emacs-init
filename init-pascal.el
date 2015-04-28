;;; init-pascal.el --- Object Pascal Mode


;;; Commentary:
;; 

;;; Code:

(add-to-list 'auto-mode-alist '("\\.pas$" . opascal-mode))
(add-to-list 'auto-mode-alist '("\\.dpr$" . opascal-mode))
(add-to-list 'auto-mode-alist '("\\.frm$" . opascal-mode))

(provide 'init-pascal)

;;; init-pascal.el ends here
