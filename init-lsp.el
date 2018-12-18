;;; init-lsp.el --- LSP

;;; Commentary:
;;

;;; Code:

(use-package lsp-mode
	:ensure t
	:config
	(require 'lsp-clients)
	(add-hook 'programming-mode-hook 'lsp))

(use-package lsp-ui
  :after (:all markdown-mode lsp-mode)
  :ensure t
  :config (add-hook 'lsp-mode-hook 'lsp-ui-mode))


;; (use-package lsp-python
;;   :after (:all lsp-mode)
;;   :ensure t
;;   :config (add-hook 'python-mode-hook #'lsp-python-enable)
;;   )

(use-package lsp-java
  :after (:all lsp-ui-flycheck lsp-ui-sideline)
  :ensure t
  :config
  (add-hook 'java-mode-hook  'lsp-java-enable)
  (add-hook 'java-mode-hook  (lambda () (lsp-ui-flycheck-enable t)))
  (add-hook 'java-mode-hook  'lsp-ui-sideline-mode)
  ;; set the projects that are going to be imported into the workspace.
	;; (setq lsp-java--workspace-folders (list "/path/to/project1"
  ;;																				"/path/to/project2"
  ;;																				...))
  )

;; (use-package lsp-clangd
;; 	:ensure t
;; 	:config
;; 	(with-eval-after-load 'lsp-mode
;; 		(require 'lsp-clangd)
;; 		(add-hook 'c-mode--hook #'lsp-clangd-c-enable)
;; 		(add-hook 'c++-mode-hook #'lsp-clangd-c++-enable)
;; 		(add-hook 'objc-mode-hook #'lsp-clangd-objc-enable))
;; 	)

(use-package lsp-html
  :ensure t
  :ensure-system-package
  ((html-languageserver . "npm i -g vscode-html-languageserver-bin"))
  :config
  (add-hook 'html-mode-hook #'lsp-html-enable))


(defun init-lsp/lsp-css/css-mode-setup ()
  (when (eq major-mode 'css-mode)
    ;; Only enable in strictly css-mode, not scss-mode (css-mode-hook
    ;; fires for scss-mode because scss-mode is derived from css-mode)
    (lsp-css-enable)))

;; (use-package lsp-css
;;   :ensure t
;;   :ensure-system-package
;;   ((css-languageserver . "npm i -g vscode-css-languageserver-bin"))
;;   :config
;;   (add-hook 'css-mode-hook #'init-lsp/lsp-css/css-mode-setup)
;;   (add-hook 'less-mode-hook #'lsp-less-enable)
;;   (add-hook 'sass-mode-hook #'lsp-scss-enable)
;;   (add-hook 'scss-mode-hook #'lsp-scss-enable))

(use-package lsp-go
  :ensure t
  :ensure-system-package 
  ((go-langserver . "go get -u github.com/sourcegraph/go-langserver")
   (dep . "go get -u github.com/golang/dep/cmd/dep")
   (gocode . "go get -u github.com/nsf/gocode"))
  :config
  (add-hook 'go-mode-hook #'lsp-go-enable))

(use-package lsp-ocaml
  :ensure t
  :ensure-system-package
  ((ocaml-language-server . "npm i -g ocaml-language-server"))
  :config
  (add-hook 'tuareg-mode-hook #'lsp-ocaml-enable)
  (add-hook 'caml-mode-hook #'lsp-ocaml-enable)
  (add-hook 'reason-mode-hook #'lsp-ocaml-enable) ;; for Reason support
  )


(use-package company-lsp
  :after company
  :ensure t
  :config
  (push 'company-lsp company-backends)
  (setq company-lsp-enable-snippet t
	company-lsp-cache-candidates t))

(use-package dap-mode
  :ensure t
  :config
  (dap-mode 1)
  (dap-ui-mode 1))

;; Requires Eclispe JDT Server
;;(use-package dap-java :ensure t)

;; pip install "ptvsd>=4.2"
;; (use-package dap-python :ensure t)

(provide 'init-lsp)

;;; init-lsp.el ends here
