;;; init-skeletor.el --- Skeletor

;;; Commentary:
;; 

(use-package skeletor
	:ensure t
	:config
	(skeletor-define-template "skewer-index-html-package"
		:title "Skewer Index Html"
		:no-license? t
		:no-git? t
		:substitutions
		'(("__TITLE__" . (lambda () (read-string "Description: ")))))
	)

(provide 'init-skeletor)

;;; init-skeletor.el ends here
