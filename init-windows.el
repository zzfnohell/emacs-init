;;; init-windows.el --- Windows -*- lexical-binding: t -*-

;;; Commentary:
;; 

;;; Code:

(use-package winum
  :ensure t
  :config
  (winum-mode))

(require 'speedbar)
(use-package sr-speedbar
  :ensure t)

(use-package minimap
  :ensure t)

(use-package window-purpose
	:config
	(purpose-mode)

	(require 'window-purpose-x)
	(purpose-x-magit-multi-on)
	(purpose-x-kill-setup)
	
	(add-to-list 'purpose-user-mode-purposes
							 '(ggtags-global-mode . ggtags-global))
	(add-to-list 'purpose-user-mode-purposes
							 '(rg-mode . rg))
	;; (add-to-list 'purpose-user-mode-purposes '(<major-mode> . <purpose>))
	;; (add-to-list 'purpose-user-name-purposes '(<name> . <purpose>))
	;; (add-to-list 'purpose-user-regexp-purposes '(<pattern> . <purpose>))
	(setq purpose-use-default-configuration t) ; not really necessary, default is t
	(purpose-compile-user-configuration))


(use-package perspective
	:bind (("C-x b" . persp-switch-to-buffer*)
         ("C-x k" . persp-kill-buffer*))
  :config
  (persp-mode))


(use-package golden-ratio
	:config
	(golden-ratio-mode 1))

(winner-mode)


(use-package dimmer
	:ensure t
	:config
	(dimmer-configure-which-key)
	(dimmer-configure-company-box)
	(dimmer-configure-gnus)
	(dimmer-configure-magit)
	(dimmer-configure-org)
	(dimmer-configure-posframe)
	(dimmer-mode t))

(provide 'init-windows)

;;; init-windows.el ends here
