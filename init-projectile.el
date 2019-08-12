;;; init-projectile.el --- Projectile

;;; Commentary:
;;;

;;; Code:
(use-package projectile
  :config
	(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
	(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
	(projectile-mode +1)
  )

(use-package projectile-ripgrep)

(provide 'init-projectile)
;;; init-projectile.el ends here
