;;; init-auto-compile.el --- AUTO-COMPLETE

;;; Commentary:
;; 
(require-package 'auto-compile)
(require 'auto-compile)
(setq load-prefer-newer t)
(auto-compile-on-load-mode 1)
(auto-compile-on-save-mode 1)


(provide 'init-auto-compile)

;;; init-auto-compile.el ends here
