;;; init-ess.el --- ESS


;;; Commentary:
;; ESS
;; on cygwin, ess-compat.el
;; (defvar ess-microsoft-p  (eq system-type 'windows-nt)
;;   "Value is t if the OS is one of Microsoft's, nil otherwise.")
;;; Code:

(use-package julia-mode
  :ensure t)

(use-package lsp-julia
	:ensure t
  :after (:all julia-mode lsp-mode)
  :config
  (add-hook 'julia-mode-hook #'lsp-mode)
  (add-hook 'julia-mode-hook #'lsp))

(use-package ess
  :ensure t
  :after (:all julia-mode)
  :config
  (setq ess-history-directory "~/.ess/")
	(require 'ess-site)
	(require 'ess-julia)
	(setq inferior-julia-program-name "julia"))

(use-package stan-mode
  :ensure t)

(use-package stan-snippets
  :ensure t)

(use-package ess-view-data
  :ensure t)

(when (eq system-type 'gnu/linux)
  (use-package vterm
    :ensure t)
  
  (use-package julia-snail
    :ensure t
    :requires vterm
    :hook (julia-mode . julia-snail-mode)))

(message "loading init-ess done.")

(provide 'init-ess)

;;; init-ess.el ends here
