(load "~/.emacs.d/config/config.el")
(load-config "system")

(if (linux-p)
    (progn
      (require 'emms-setup)
      (emms-standard)
      (emms-default-players)))
  