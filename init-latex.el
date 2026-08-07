;;; init-latex.el --- Latex

;;; Commentary:
;;

(use-package tex
  :ensure auctex
  :defer t)

(use-package tikz
  :ensure t
  :defer t
  :commands tikz-mode)

(message "[init] init-latex loaded")
(provide 'init-latex)

;;; init-latex.el ends here
