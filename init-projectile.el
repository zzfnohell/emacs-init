;;; init-projectile.el --- Projectile

;;; Commentary:
;;;

(use-package projectile
	:ensure t
	:config
	(projectile-global-mode)
	(setq projectile-indexing-method 'native)
	;; (setq projectile-completion-system 'default)
	(setq projectile-completion-system 'helm))

(use-package helm-projectile
	:ensure t
	:config
	(helm-projectile-on))


(provide 'init-projectile)

;;; init-porjectile.el ends here
