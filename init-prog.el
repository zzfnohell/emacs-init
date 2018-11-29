;;; init-prog.el --- Prog Mode



;;; Commentary:
;; 

;;; Code:

(use-package yafolding
	:ensure t
	:config
	(add-hook 'prog-mode-hook (lambda () (yafolding-mode))))

(use-package rainbow-delimiters
	:ensure t
	:config
	(add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(provide 'init-prog)

;;; init-prog.el ends here
