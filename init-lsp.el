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
  :custom
  ;; lsp-ui-doc
  (lsp-ui-doc-enable nil)
  (lsp-ui-doc-header t)
  (lsp-ui-doc-include-signature nil)
  (lsp-ui-doc-position 'at-point) ;; top, bottom, or at-point
  (lsp-ui-doc-max-width 120)
  (lsp-ui-doc-max-height 30)
  (lsp-ui-doc-use-childframe t)
  (lsp-ui-doc-use-webkit t)
  ;; lsp-ui-flycheck
  (lsp-ui-flycheck-enable nil)
  ;; lsp-ui-sideline
  (lsp-ui-sideline-enable nil)
  (lsp-ui-sideline-ignore-duplicate t)
  (lsp-ui-sideline-show-symbol t)
  (lsp-ui-sideline-show-hover t)
  (lsp-ui-sideline-show-diagnostics nil)
  (lsp-ui-sideline-show-code-actions t)
  (lsp-ui-sideline-code-actions-prefix "")
  ;; lsp-ui-imenu
  (lsp-ui-imenu-enable t)
  (lsp-ui-imenu-kind-position 'top)
  ;; lsp-ui-peek
  (lsp-ui-peek-enable t)
  (lsp-ui-peek-peek-height 20)
  (lsp-ui-peek-list-width 50)
  (lsp-ui-peek-fontify 'on-demand) ;; never, on-demand, or always
  :preface
  (defun toggle-lsp-ui-doc ()
    (interactive)
    (if lsp-ui-doc-mode
        (progn
          (lsp-ui-doc-mode -1)
          (lsp-ui-doc--hide-frame))
      (lsp-ui-doc-mode 1)))
  :bind
  (:map lsp-mode-map
        ("C-c C-r" . lsp-ui-peek-find-references)
        ("C-c C-j" . lsp-ui-peek-find-definitions)
        ("C-c i"   . lsp-ui-peek-find-implementation)
        ("C-c m"   . lsp-ui-imenu)
        ("C-c s"   . lsp-ui-sideline-mode)
        ("C-c d"   . toggle-lsp-ui-doc))
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
