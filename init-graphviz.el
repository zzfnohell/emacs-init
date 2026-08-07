;;; init-graphviz.el --- graphviz


;;; Commentary:
;;

;;; Code:

(use-package graphviz-dot-mode
  :ensure t
  :defer t
  :mode ("\\.dot\\'" "\\.gv\\'"))

(message "[init] init-graphviz loaded")
(provide 'init-graphviz)

;;; init-graphviz.el ends here
