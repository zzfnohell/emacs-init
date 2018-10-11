;;; init-utils.el --- Utils


;;; Commentary:
;; 

;;; Code:

(when (eq system-type 'windows-nt)
  (setq w32-get-true-file-attributes nil)
  (global-auto-revert-mode -1))

(provide 'init-utils)

;;; init-utils.el ends here
