;;; init-racket.el --- Racket

;;; Commentary:
;; 

(use-package geiser
	:ensure t
	 
	)

(use-package quack
	:after geiser
	:ensure t
	 
	)

(provide 'init-racket)

;;; init-racket.el ends here
