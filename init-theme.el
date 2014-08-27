;;; init-theme.el --- color-theme

;;; Commentary:
;; 

;;; Code:

(require-package 'color-theme)
(color-theme-initialize)

(require-package 'color-theme-solarized)
(color-theme-solarized-dark)
(provide 'init-theme)

;;; init-theme.el ends here
