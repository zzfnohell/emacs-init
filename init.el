;;; init.el --- init

;;; Commentary:
;; 

;;; Code:

;; (setq debug-on-error t)

;; (setq debug-on-message ".*ad-handle-definition.*")
;; (setq debug-on-message ".*error.*")

(setq custom-file "~/.emacs.d/custom.el")
(unless (file-exists-p custom-file)
  (write-region "" nil custom-file))

(when (file-exists-p custom-file)
  (load custom-file))

(load "~/.emacs.d/init/init-main.el")



;;; init.el ends here
