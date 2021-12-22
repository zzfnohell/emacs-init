;;; init-theme.el --- theme

;;; Commentary:
;; 

;;; Code:

(use-package color-theme-sanityinc-solarized
	:ensure t)
(use-package color-theme-sanityinc-tomorrow
	:ensure t)

(setq custom-safe-themes t)
(defun init-theme/load-default-theme ()
	(load-theme 'sanityinc-solarized-light t))

(add-hook 'after-init-hook #'init-theme/load-default-theme)

(provide 'init-theme)

;;; init-theme.el ends here
