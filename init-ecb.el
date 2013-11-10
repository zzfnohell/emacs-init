(require 'ecb)
;(require 'ecb-autoloads)

(setq stack-trace-on-error t)
;(ecb-byte-compile)

(setq ecb-auto-activate nil
      ecb-tip-of-the-day nil
      inhibit-startup-message t
      ecb-auto-compatibility-check nil
      ecb-version-check t)


(add-to-list 'ecb-source-path (list *workspace* "default"))
\n(provide \'init-ecb.el)
