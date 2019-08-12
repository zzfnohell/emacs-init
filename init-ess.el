;;; init-ess.el --- ESS


;;; Commentary:
;; ESS
;; on cygwin, ess-compat.el
;; (defvar ess-microsoft-p  (eq system-type 'windows-nt)
;;   "Value is t if the OS is one of Microsoft's, nil otherwise.")
;;; Code:

(use-package ess
	:config
	(require 'ess-site)
	(require 'ess-julia)
	(setq inferior-julia-program-name "julia"))

(use-package ess-view)

(use-package julia-mode)

(use-package stan-mode)
(use-package stan-snippets)

(provide 'init-ess)

;;; init-ess.el ends here
