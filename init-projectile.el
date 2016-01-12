;;; init-projectile.el --- Projectile

;;; Commentary:
;;
(require-package 'projectile)
(setq projectile-indexing-method 'native)
(setq projectile-completion-system 'default)

(projectile-global-mode)

(provide 'init-projectile)

;;; init-porjectile.el ends here
