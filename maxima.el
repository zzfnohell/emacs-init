(cond 
 ((or (cygwin-p) (linux-p))
  (require 'maxima)
  (require 'imaxima)))

(setq auto-mode-alist (cons '("\\.mac" . maxima-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.wxm" . maxima-mode) auto-mode-alist))