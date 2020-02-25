;;; init-lsp.el --- LSP

;;; Commentary:
;;

;;; Code:
(use-package lsp-mode
  :init (setq lsp-keymap-prefix "s-l")
  :hook (
         (cc-mode . lsp-deferred)
         (cmake-mode . lsp-deferred)
         (csharp-mode . lsp-deferred)
         (css-mode . lsp-deferred)
         (fsharp-mode . lsp-deferred)
         (go-mode . lsp-deferred)
         (haskell-mode . lsp-deferred)
         (html-mode . lsp-deferred)
         (js2-mode . lsp-deferred)
         (julia-mode . lsp-deferred)
         (python-mode . lsp-deferred)
         (rust-mode . lsp-deferred)
         (scala-mode . lsp-deferred)
         (xml-mode . lsp-deferred)
         (yaml-mode . lsp-deferred)
         (lsp-mode . lsp-enable-which-key-integration)) 
  :commands (lsp lsp-deferred))

(use-package lsp-ui :commands lsp-ui-mode)

(use-package company-lsp
  :after company
  :commands company-lsp)

(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs
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
