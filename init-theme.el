;;; init-theme.el --- color-theme

;;; Commentary:
;; 

;;; Code:

(use-package color-theme
  :config
  (progn
    (color-theme-initialize)
    (setq color-theme-is-global t))
  )

(provide 'init-theme)

;;; init-theme.el ends here
