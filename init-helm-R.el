(cond 
 ((not (eq 'w32 window-system))
  (require-package 'helm-R)
  (require 'helm-R))
 (t t))

(provide 'init-helm-R)
