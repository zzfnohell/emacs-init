;;; init-theme.el --- theme

;;; Commentary:
;; 

;;; Code:


(setq custom-safe-themes t)

;; (defun init-theme/load-default-theme ()
;; 	(load-theme 'humanoid-light t))

(defun init-theme/load-default-theme ()
	(load-theme 'faff t))

(add-hook 'after-init-hook #'init-theme/load-default-theme)

(provide 'init-theme)

;;; init-theme.el ends here
