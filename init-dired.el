;; set dired mode format,put it before the desktop load
(cond 
 ((windows-p) 
  (setq dired-listing-switches "-alk"))
 (t 
  (setq dired-listing-switches "-avl --time-style=long-iso")))
\n(provide \'init-dired.el)
