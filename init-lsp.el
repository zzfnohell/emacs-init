;;; init-lsp.el --- LSP

;;; Commentary:
;;

;;; Code:
(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :custom
  (lsp-enable-completion-at-point t)
  (lsp-prefer-capf t)
  :config
  (require 'lsp-clients))

;; LSP UI tools
(use-package lsp-ui
  :hook
  (lsp-mode . lsp-ui-mode))

(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)

(use-package lsp-treemacs
  :after treemacs
  :commands lsp-treemacs-errors-list)

(use-package which-key
  :config
  (which-key-mode))

;; pip install "ptvsd>=4.2"
;; (use-package dap-python 
;;   :ensure-system-package 
;;   ((ptvsd . "pip install ptvsd")))

;; (use-package lsp-clangd
;;   :after (:all lsp-mode)
;;   :config 
;;   (with-eval-after-load 'lsp-mode
;;     (require 'lsp-clangd)
;;     (add-hook 'c-mode-hook #'lsp-clangd-c-enable)
;;     (add-hook 'c++-mode-hook #'lsp-clangd-c++-enable)
;;     (add-hook 'objc-mode-hook #'lsp-clangd-objc-enable)))

;; (use-package lsp-php
;;   :config
;;   (add-hook 'php-mode-hook #'lsp-php-enable))

(provide 'init-lsp)

;;; init-lsp.el ends here
