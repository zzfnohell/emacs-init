
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(setq debug-on-error t)
(setq debug-on-message "^ad-handle-definition.*")
(package-initialize)

(load "~/.emacs.d/init/init-main.el")
(setq custom-file "~/.emacs.d/init/custom.el")
(load custom-file)

