;;; init-projectile.el --- Projectile

;;; Commentary:
;;
(require-package 'projectile)
(setq projectile-indexing-method 'native)
(setq projectile-completion-system 'default)
(projectile-global-mode)

(require-package 'helm-projectile)
(require 'helm-projectile)
(helm-projectile-on)

(provide 'init-projectile)

;;; init-porjectile.el ends here
