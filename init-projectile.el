;;; init-projectile.el --- Projectile

;;; Commentary:
;;
(require-package 'projectile)
(projectile-global-mode)
(setq projectile-indexing-method 'native)
;; (setq projectile-completion-system 'default)
(setq projectile-completion-system 'helm)

(require-package 'helm-projectile)
(require 'helm-projectile)

(helm-projectile-on)

(provide 'init-projectile)

;;; init-porjectile.el ends here
