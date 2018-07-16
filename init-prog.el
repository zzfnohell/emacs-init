;;; init-prog.el --- Prog Mode



;;; Commentary:
;; 

;;; Code:

(req-package yafolding
	:config
	(add-hook 'prog-mode-hook
						(lambda () (yafolding-mode)))
)

(provide 'init-prog)

;;; init-prog.el ends here
