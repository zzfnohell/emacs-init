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

(use-package deft
  :ensure t
  :demand t
  :bind ("<f8>" . deft)
  :commands (deft)
  :config
  (setq deft-recursive t)
  (setq deft-extensions '("txt" "tex" "org")))

(use-package graphviz-dot-mode
  :ensure t
  :demand t)

(use-package regex-tool
  :ensure t
  :demand t)

(provide 'init-tools)

;;; init-tools.el ends here
