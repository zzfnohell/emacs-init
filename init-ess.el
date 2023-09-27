;;; init-ess.el --- ESS


;;; Commentary:
;; ESS
;; on cygwin, ess-compat.el
;; (defvar ess-microsoft-p  (eq system-type 'windows-nt)
;;   "Value is t if the OS is one of Microsoft's, nil otherwise.")
;;; Code:

(use-package julia-mode
  :ensure t)

(use-package ess
  :ensure t
  :commands R
  :config
  (setq ess-history-directory "~/.ess/")
	(require 'ess-site)
	(require 'ess-julia)
	(setq inferior-julia-program-name "julia"))

(use-package stan-mode
  :ensure t
  :hook
  (stan-mode . stan-snippets-initialize))

(use-package stan-snippets
  :ensure t
  :autoload stan-snippets-initialize
  :defer t)

(use-package ess-view-data
  :ensure t
  :hook
  (ess-mode . ess-view-data-mode))

(use-package vterm
  :ensure t
  :when (eq system-type 'gnu/linux))

(use-package julia-snail
  :ensure t
  :requires vterm
  :when (eq system-type 'gnu/linux)
  :hook
  (julia-mode . julia-snail-mode))

(use-package julia-repl
  :ensure t
  :hook
  (julia-mode . julia-repl-mode))

(message "loading init-ess done.")

(provide 'init-ess)

;;; init-ess.el ends here
