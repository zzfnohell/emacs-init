;;; init-fricas.el --- FriCAS

;;; Code:
(cond 
 ((eq system-type 'gnu/linux)
  (server-start)
  (setq load-path 
	(cons (quote "/usr/local/lib/fricas/emacs")
	      load-path))
  (setq auto-mode-alist
	(cons (quote ("\\.fri$" . fricas-mode))
	      auto-mode-alist))
  (require 'fricas))
 (t t))

;;; Commentary:
;;
(provide 'init-fricas)

;;; init-fricas.el ends here
