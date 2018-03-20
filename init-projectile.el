;;; init-projectile.el --- Projectile

;;; Commentary:
;;;

(req-package projectile
  :config
  (projectile-global-mode)
  (setq projectile-indexing-method 'native)
	;; (setq projectile-completion-system 'default)
	(setq projectile-completion-system 'helm))

(req-package helm-projectile
  :require helm-make helm-projectile emr
  :config (helm-projectile-on))


(provide 'init-projectile)

;;; init-porjectile.el ends here
