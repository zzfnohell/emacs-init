(cond
 ((cygwin-p) (progn (require 'cygwin-mount)
                    (cygwin-mount-activate))))




(provide 'init-cygwin-mount)
