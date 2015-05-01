;;; init-lex.el --- LEX

;;; Commentary:
;; 

;;; Code:

(require-package 'bison-mode)
(require 'bison-mode)
(require-package 'lex)
(require 'lex)

(add-to-list 'auto-mode-alist '("\\.lex\\'" . bison-mode))
(add-to-list 'auto-mode-alist '("\\.yy\\'" . bison-mode))
(add-to-list 'auto-mode-alist '("\\.y\\'" . bison-mode))

(provide 'init-lex)

;;; init-lex.el ends here
