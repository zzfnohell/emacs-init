;;; init-lex.el --- LEX

;;; Commentary:
;; 

;;; Code:

(use-package bison-mode
	:ensure t
	 
  :mode (("\\.lex\\'" . bison-mode)
         ("\\.yy\\'" . bison-mode)
         ("\\.y\\'" . bison-mode))
  )


(use-package lex
  :ensure t
   )

(provide 'init-lex)

;;; init-lex.el ends here
