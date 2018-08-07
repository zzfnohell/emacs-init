;;; init-projectile.el --- Projectile

;;; Commentary:
;;;

(use-package projectile
  :ensure t
  :custom
  (projectile-enable-caching t)
  (projectile-completion-system 'helm)
  :config
  (projectile-global-mode)
  )

(use-package helm-projectile
  :ensure t
  :config
  (helm-projectile-on))


(provide 'init-projectile)

;;; init-porjectile.el ends here
