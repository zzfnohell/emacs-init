;;; init-ess.el --- ESS


;;; Commentary:
;; ESS
;; on cygwin, ess-compat.el
;; (defvar ess-microsoft-p  (eq system-type 'windows-nt)
;;   "Value is t if the OS is one of Microsoft's, nil otherwise.")
;;; Code:
(require-package 'ess-R-data-view)
(require-package 'ess-R-object-popup)
(require 'ess-R-object-popup)

(provide 'init-ess)
;;; init-ess.el ends here
