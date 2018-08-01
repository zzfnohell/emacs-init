;;; init-racket.el --- Racket

;;; Commentary:
;; 

(use-package geiser
	:ensure t
	:defer t
	)

(use-package quack
	:after geiser
	:ensure t
	:defer t
	)

(provide 'init-racket)

;;; init-racket.el ends here
