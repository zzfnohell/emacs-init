;;; init-latex.el --- Latex

;;; Commentary:
;;

(use-package tex
	:ensure auctex
  :defer t)

(use-package tikz
	:ensure t
  :defer t)

(message "loading init-latex done.")
(provide 'init-latex)

;;; init-latex.el ends here
