;;; init-lsp.el --- LSP

;;; Commentary:
;;

;;; Code:

(use-package lsp-mode
	:ensure t
	:demand t
	:config
	(require 'lsp-imenu)
	(add-hook 'prog-major-mode #'lsp-prog-major-mode-enable)
	(add-hook 'lsp-after-open-hook 'lsp-enable-imenu)
	)

(use-package lsp-ui
	:after (:all markdown-mode lsp-mode)
	:ensure t
	:demand t
	:config
	(add-hook 'lsp-mode-hook 'lsp-ui-mode)
	(setq lsp-ui-sideline-enable t
				lsp-ui-sideline-show-symbol t
				lsp-ui-sideline-show-hover t
				lsp-ui-sideline-show-code-actions t
				lsp-ui-sideline-update-mode 'point))



(use-package lsp-python
	:ensure t
	 
	:config
	(add-hook 'python-mode-hook #'lsp-python-enable)
	)

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

(use-package lsp-clangd
	:ensure t
	 
	:config
	(with-eval-after-load 'lsp-mode
		(require 'lsp-clangd)
		(add-hook 'c-mode--hook #'lsp-clangd-c-enable)
		(add-hook 'c++-mode-hook #'lsp-clangd-c++-enable)
		(add-hook 'objc-mode-hook #'lsp-clangd-objc-enable))
	)

(use-package lsp-html
	:ensure t
	 
	:config
	(add-hook 'html-mode-hook #'lsp-html-enable)
	)


(defun init-lsp/lsp-css/css-mode-setup ()
	(when (eq major-mode 'css-mode)
		;; Only enable in strictly css-mode, not scss-mode (css-mode-hook
		;; fires for scss-mode because scss-mode is derived from css-mode)
		(lsp-css-enable)))

(use-package lsp-css
	:ensure t
	 
	:config
	(add-hook 'css-mode-hook #'init-lsp/lsp-css/css-mode-setup)
	(add-hook 'less-mode-hook #'lsp-less-enable)
	(add-hook 'sass-mode-hook #'lsp-scss-enable)
	(add-hook 'scss-mode-hook #'lsp-scss-enable))

(use-package lsp-go
	:ensure t
	 
	:config
	(add-hook 'go-mode-hook #'lsp-go-enable))

(use-package lsp-ocaml
	:ensure t
	 
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
				company-lsp-cache-candidates t)
	)

(provide 'init-lsp)

;;; init-lsp.el ends here
