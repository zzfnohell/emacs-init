;;; init-format.el --- Fomat

;;; Commentary:
;; 

;;; Code:

(use-package fuzzy-format
	:ensure t
  :config
  (progn
    (setq fuzzy-format-default-indent-tabs-mode nil)
    (global-fuzzy-format-mode t)
    )
  )

(provide 'init-format)

;;; init-format.el ends here
