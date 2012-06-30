;; set dired mode format,put it before the desktop load

(cond 
 ((windows-p) nil)
 (t (setq dired-listing-switches "--time-style=long-iso -l")))
