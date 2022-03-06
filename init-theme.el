;;; init-theme.el --- theme

;;; Commentary:
;; 

;;; Code:

(use-package humanoid-themes
  :ensure t)

(setq custom-safe-themes t)

(defun init-theme/load-default-theme ()
	(load-theme 'humanoid-light t))

(add-hook 'after-init-hook #'init-theme/load-default-theme)

(provide 'init-theme)

;;; init-theme.el ends here
