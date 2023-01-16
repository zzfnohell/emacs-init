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
  :defer t
	:config
	(setq magit-refresh-status-buffer nil))

(use-package magit-lfs
  :ensure t
  :defer t
  :pin melpa)

(use-package magit-imerge
  :ensure t
  :defer t)

(use-package vc-fossil
	:ensure t
  :defer t
	:init
	(add-to-list 'vc-handled-backends 'Fossil t))

(use-package git-modes
	:ensure t
  :defer t)

(use-package gitignore-snippets
	:ensure t
  :defer t)

(provide 'init-vc)
;;; init-vc.el ends here
