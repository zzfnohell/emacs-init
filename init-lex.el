;;; init-lex.el --- LEX

;;; Commentary:
;; 

;;; Code:

(use-package bison-mode
  :mode (("\\.lex\\'" . bison-mode)
         ("\\.yy\\'" . bison-mode)
         ("\\.y\\'" . bison-mode))
  )


(use-package lex)

(provide 'init-lex)

;;; init-lex.el ends here
