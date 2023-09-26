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
  :commands magit)

(use-package magit-lfs
  :ensure t
  :pin melpa
  :hook
  (magit-mode . magit-lfs))

(use-package magit-imerge
  :ensure t
  :defer t)

(use-package vc-fossil
	:ensure t
	:init
	(add-to-list 'vc-handled-backends 'Fossil t))

(use-package git-modes
	:ensure t)

(use-package git-timemachine
  :ensure t
  :bind
  (("s-t" . git-timemachine-toggle)))

(provide 'init-vc)
;;; init-vc.el ends here
