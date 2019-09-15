;;; init-lsp.el --- LSP

;;; Commentary:
;;

;;; Code:
(use-package lsp-mode
  :commands lsp
  ;; :ensure-system-package
  ;; ((bash-language-server . "npm i -g bash-language-server")
  ;;  (vscode-html-languageserver-bin . "npm i -g vscode-html-languageserver-bin")
  ;;  (vscode-css-languageserver-bin . "npm i -g vscode-css-languageserver-bin")
  ;;  (javascript-typescript-langserver . "npm i -g javascript-typescript-langserver")
  ;;  (go-langserver . "go get -u github.com/sourcegraph/go-langserver")
  ;;  (ocaml-language-server . "npm i -g ocaml-language-server")
  ;;  (python-language-server . "pip install \"python-language-server[all]\""))
  )

(use-package lsp-ui :commands lsp-ui-mode)

(use-package company-lsp
  :after company
  :config
  (push 'company-lsp company-backends)
  (setq company-lsp-enable-snippet t company-lsp-cache-candidates t))

;; (use-package dap-mode
;;   :after (:all lsp-mode)
;;   :config
;;   (dap-mode 1)
;;   (dap-ui-mode 1))

;; Requires Eclispe JDT Server
;; (use-package dap-java)

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
