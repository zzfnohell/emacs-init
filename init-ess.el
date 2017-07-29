;;; init-ess.el --- ESS


;;; Commentary:
;; ESS
;; on cygwin, ess-compat.el
;; (defvar ess-microsoft-p  (eq system-type 'windows-nt)
;;   "Value is t if the OS is one of Microsoft's, nil otherwise.")
;;; Code:

(use-package ess-R-data-view :defer t)
(use-package ess-R-object-popup :defer t)

(provide 'init-ess)

;;; init-ess.el ends here
