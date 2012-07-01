(load "~/.emacs.d/config/config.el")
(load-config "parameters")

(require 'ecb)
(require 'ecb-autoloads)

(setq stack-trace-on-error t)
(ecb-byte-compile)

(setq ecb-auto-activate nil
      ecb-tip-of-the-day nil
      inhibit-startup-message t
      ecb-auto-compatibility-check nil
      ecb-version-check t)


(custom-set-variables
 '(ecb-source-path (quote ((*workspace* "default")))))

