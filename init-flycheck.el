;;; init-flycheck.el --- Flycheck

;;; Commentary:
;;

;;; Code:

(use-package flycheck
	:ensure t
	
	:config (add-hook 'after-init-hook #'global-flycheck-mode))

(use-package flycheck-clang-analyzer
	:ensure t
	
	:config
	(progn
		(with-eval-after-load 'flycheck
			(require 'flycheck-clang-analyzer)
			(flycheck-clang-analyzer-setup))
		)
	)

(use-package flycheck-flow
	:ensure t
	:config
	(add-hook 'javascript-mode-hook 'flycheck-mode)
)

(provide 'init-flycheck)

;;; init-flycheck.el ends here
