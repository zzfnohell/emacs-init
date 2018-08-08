;;; init-projectile.el --- Projectile

;;; Commentary:
;;;

(use-package projectile
  :ensure t
  :config
  (projectile-global-mode)
  )

(use-package helm-projectile
  :ensure t
  :config
  (helm-projectile-on))


(provide 'init-projectile)

;;; init-porjectile.el ends here
