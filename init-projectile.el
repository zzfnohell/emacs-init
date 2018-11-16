;;; init-projectile.el --- Projectile

;;; Commentary:
;;;

;;; Code:
(use-package projectile
  :ensure t
  :config
	(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
	(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
	(projectile-mode +1)
  )

(use-package projectile-ripgrep :ensure t)

(provide 'init-projectile)
;;; init-projectile.el ends here
