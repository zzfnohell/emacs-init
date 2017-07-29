;;; init-dired.el ---
;;; Code:

;;; Commentary:
;; 

;; set dired mode format,put it before the desktop load

(cond 
 ((eq 'windows-nt system-type) nil)
 ((eq 'darwin system-type) nil)
 (t (setq dired-listing-switches "-avl --time-style=long-iso")))

(provide 'init-dired)

;;; init-dired.el ends here
