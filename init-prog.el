;;; init-prog.el --- Prog Mode



;;; Commentary:
;; 

;;; Code:

(use-package yafolding
	:ensure t
	:config
	(add-hook 'prog-mode-hook
						(lambda () (yafolding-mode)))
)

(provide 'init-prog)

;;; init-prog.el ends here
