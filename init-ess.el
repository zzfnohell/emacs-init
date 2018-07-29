;;; init-ess.el --- ESS


;;; Commentary:
;; ESS
;; on cygwin, ess-compat.el
;; (defvar ess-microsoft-p  (eq system-type 'windows-nt)
;;   "Value is t if the OS is one of Microsoft's, nil otherwise.")
;;; Code:

(use-package ess
	:ensure t
	:config
	(require 'ess-site)
	(require 'ess-julia)
	(setq inferior-julia-program-name "julia")
	)
(use-package ess-view :ensure t)
(use-package ess-R-data-view :ensure t)
(use-package ess-R-object-popup :ensure t)

(use-package julia-mode :ensure t)

(provide 'init-ess)

;;; init-ess.el ends here
