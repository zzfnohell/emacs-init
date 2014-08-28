
(cond
 ((eq system-type 'gnu/linux)
  (require-package 'emms)
  (require 'emms-setup)
  (emms-default-players)))
(provide 'init-emms)
