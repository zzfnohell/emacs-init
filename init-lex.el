;;; init-lex.el --- LEX

;;; Commentary:
;; 

;;; Code:

(use-package bison-mode
  :config
  (progn
    (add-to-list 'auto-mode-alist '("\\.lex\\'" . bison-mode))
    (add-to-list 'auto-mode-alist '("\\.yy\\'" . bison-mode))
    (add-to-list 'auto-mode-alist '("\\.y\\'" . bison-mode))))

(use-package lex)

(provide 'init-lex)

;;; init-lex.el ends here
