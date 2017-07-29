;;; init.el --- init

;;; Commentary:
;; 

;;; Code:

;; (setq debug-on-error t)

;; (setq debug-on-message ".*ad-handle-definition.*")
;; (setq debug-on-message ".*error.*")

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(load "~/.emacs.d/init/init-main.el")
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;;; init.el ends here
