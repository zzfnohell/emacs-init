;;; init-dired.el ---
;;; Code:

;; set dired mode format,put it before the desktop load

(cond 
 ((windows-p) nil)
 ((darwin-p) nil)
 (t (setq dired-listing-switches "-avl --time-style=long-iso")))

(require-package 'dired+)
(require 'dired+)
(customize-set-variable
 'diredp-hide-details-initially-flag nil)


;;; Commentary:
;; 

(provide 'init-dired)

;;; init-dired.el ends here
