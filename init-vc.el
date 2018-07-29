;;; init-vc.el --- Version Control

;;; Commentary:
;; 

;;; Code:

(use-package ahg
	:ensure t
	:defer t)

;; (require 'diff-mode)
;; (require 'easymenu)
;; (require 'log-edit)
;; (require 'ewoc)
;; (require 'vc-annotate)

(use-package magit
  :ensure t
  :defer t)


(provide 'init-vc)

;;; init-vc.el ends here
