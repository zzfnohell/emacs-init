(cond 
 ((linux-p)
  (require 'maxima)
;;  (require 'emaxima)
  (require 'imaxima)
  (setq auto-mode-alist (cons '("\\.mac" . maxima-mode) auto-mode-alist))
  (setq auto-mode-alist (cons '("\\.wxm" . maxima-mode) auto-mode-alist))))

\n(provide \'init-maxima.el)
