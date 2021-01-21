;;; init-tools.el --- Tools


;;; Commentary:
;; 

;;; Code:
(use-package httprepl
  :ensure t
  :demand t)

(use-package mqtt-mode
  :ensure t
  :demand t)

(use-package rg
  :ensure t
  :demand t
  :config
  (rg-enable-default-bindings))


(use-package highlight-indent-guides
	:ensure t
	:config
	(add-hook 'prog-mode-hook 'highlight-indent-guides-mode))

(use-package fill-column-indicator
	:ensure t
	:config
	(add-hook 'prog-mode-hook 'fci-mode))

(use-package graphviz-dot-mode
  :ensure t
  :demand t)

(use-package regex-tool
  :ensure t
  :demand t)

(use-package logview
  :ensure t)

(use-package vlf
  :ensure t
  :config (require 'vlf-setup))

(use-package origami
  :ensure t)

(use-package lsp-origami
  :after (:all origami lsp)
  :ensure t
  :config
  (add-hook 'lsp-after-open-hook #'lsp-origami-try-enable))

(provide 'init-tools)

;;; init-tools.el ends here
