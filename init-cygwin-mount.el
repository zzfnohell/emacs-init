(cond
 ((cygwin-p) (progn (require 'cygwin-mount)
                    (cygwin-mount-activate))))

\n(provide \'init-cygwin-mount.el)
