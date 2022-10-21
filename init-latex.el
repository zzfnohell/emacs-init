;;; init-latex.el --- Latex

;;; Commentary:
;; 

(use-package tex
	:ensure auctex
  :defer t)

(use-package tikz
	:ensure t)

(message "init latex")
(provide 'init-latex)

;;; init-latex.el ends here
