;;; init-dired.el ---
;;; Code:

;; set dired mode format,put it before the desktop load

(cond 
 ((eq system-type 'windows-nt) nil)
 (t (setq dired-listing-switches "-avl --time-style=long-iso")))

(require-package 'dired+)
(require 'dired+)
(customize-variable diredp-hide-details-initially-flag nil)
;;; Commentary:
;; 

(provide 'init-dired)

;;; init-dired.el ends here