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
  :defer t
  :after (:all julia-mode lsp-mode)
  :config
  (add-hook 'julia-mode-hook #'lsp-mode)
  (add-hook 'julia-mode-hook #'lsp))

(use-package ess
  :ensure t
  :defer t
  :config
  (setq ess-history-directory "~/.ess/")
	(require 'ess-site)
	(require 'ess-julia)
	(setq inferior-julia-program-name "julia"))

(use-package stan-mode
  :ensure t
  :hook ((stan-mode-hook . stan-snippets)))

(use-package stan-snippets
  :ensure t
  :defer t)

(use-package ess-view-data
  :ensure t
  :defer t)

(use-package vterm
  :ensure t
  :defer t
  :when (eq system-type 'gnu/linux))
  
(use-package julia-snail
  :ensure t
  :defer t
  :requires vterm
  :when (eq system-type 'gnu/linux)
  :hook (julia-mode . julia-snail-mode))

(use-package julia-repl
  :ensure t
  :defer t
  :config
  (add-hook 'julia-mode-hook 'julia-repl-mode))

(message "loading init-ess done.")

(provide 'init-ess)

;;; init-ess.el ends here
