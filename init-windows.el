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


(use-package perspective
  :ensure t
  :bind
  ("C-x C-b" . persp-list-buffers)         ; or use a nicer switcher, see below
  :custom
  (persp-mode-prefix-key (kbd "C-c M-p"))  ; pick your own prefix key here
  :init
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
