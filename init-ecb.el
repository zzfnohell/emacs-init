;;; init-ecb.el --- ecb

;;; Commentary:
;; 

;;; Code:

(require-package 'ecb)
(require 'ecb)

;;(setq stack-trace-on-error t)
(ecb-byte-compile)

(setq ecb-auto-activate nil
      ecb-tip-of-the-day nil
      inhibit-startup-message t
      ecb-auto-compatibility-check nil
      ecb-version-check t)

(add-to-list 'ecb-source-path (list *workspace* "default"))

(provide 'init-ecb)

;;; init-ecb.el ends here
