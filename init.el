;;; init.el --- init

;;; Commentary:
;; 

;;; Code:

;; (setq debug-on-error t)

;; (setq debug-on-message ".*ad-handle-definition.*")
;; (setq debug-on-message ".*error.*")

(setq custom-file "~/.emacs.d/custom.el")

(load "~/.emacs.d/init/init-main.el")

(when (file-exists-p custom-file)
  (load custom-file))

;;; init.el ends here
