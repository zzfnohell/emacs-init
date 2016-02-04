;;; init-dired.el ---
;;; Code:

;; set dired mode format,put it before the desktop load

(cond 
 ((windows-p) nil)
 ((darwin-p) nil)
 (t (setq dired-listing-switches "-avl --time-style=long-iso")))

;;; Commentary:
;; 

(provide 'init-dired)

;;; init-dired.el ends here
