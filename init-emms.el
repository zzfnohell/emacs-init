(if (linux-p)
    (progn
      (require 'emms-setup)
      (emms-standard)
      (emms-default-players)))
  
\n(provide \'init-emms.el)
