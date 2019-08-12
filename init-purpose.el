;;; init-purpose.el --- purpose

;;; Commentary:
;; 
(use-package  window-purpose
	:config
	(purpose-mode)
	(require 'window-purpose-x)
	(purpose-x-kill-setup)

	(setq purpose-use-default-configuration t)
	(add-to-list 'purpose-user-mode-purposes '(python-mode . py))
	(add-to-list 'purpose-user-mode-purposes '(inferior-python-mode . py-repl))
	(purpose-compile-user-configuration) 
	)

(provide 'init-purpose)

;;; init-purpose.el ends here
