;;; init-windows.el --- Windows -*- lexical-binding: t -*-

;;; Commentary:
;; 

;;; Code:

(use-package winum
  :ensure t
  :config
  (winum-mode))

(use-package speedbar
  :ensure t)

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

(winner-mode)

(provide 'init-windows)

;;; init-windows.el ends here
