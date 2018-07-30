;;; init-lex.el --- LEX

;;; Commentary:
;; 

;;; Code:

(use-package bison-mode
	:ensure t
	:defer t
  :mode (("\\.lex\\'" . bison-mode)
         ("\\.yy\\'" . bison-mode)
         ("\\.y\\'" . bison-mode))
  )


(use-package lex
  :ensure t
  :defer t)

(provide 'init-lex)

;;; init-lex.el ends here
