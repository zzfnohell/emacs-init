;;; init-vc.el --- Version Control

;;; Commentary:
;; 

;;; Code:

(use-package ahg)

;; (require 'diff-mode)
;; (require 'easymenu)
;; (require 'log-edit)
;; (require 'ewoc)
;; (require 'vc-annotate)

(use-package magit
	:config
	(setq magit-refresh-status-buffer nil))

(use-package vc-fossil)

(provide 'init-vc)
;;; init-vc.el ends here
