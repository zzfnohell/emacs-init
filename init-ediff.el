;;; init-ediff.el --- ediff

;;; Commentary:
;; 

;;; Code:

(setq ediff-split-window-function 'split-window-horizontally)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

(message "loading init-ediff done.")
(provide 'init-ediff)

;;; init-ediff.el ends here
