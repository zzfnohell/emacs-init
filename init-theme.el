;;; init-theme.el --- theme

;;; Commentary:
;; 

;;; Code:

;; (use-package doneburn-theme
;;   :ensure t
;;   :config
;;   (load-theme 'doneburn 'no-confirm))


(use-package color-theme-sanityinc-tomorrow
  :ensure t
  :config
  (require 'color-theme-sanityinc-tomorrow)
  (color-theme-sanityinc-tomorrow-day))

(provide 'init-theme)

;;; init-theme.el ends here
