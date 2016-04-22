;;; init-theme.el --- color-theme

;;; Commentary:
;; 

;;; Code:

(require-package 'color-theme)
(color-theme-initialize)
(setq color-theme-is-global t)
(color-theme-classic)

(provide 'init-theme)

;;; init-theme.el ends here
