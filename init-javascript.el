;;; init-javascript.el --- JavaScript
;; Javascript

;;; Commentary:
;;

;;; Code:

(use-package js :custom (js-indent-level 2))

(use-package json-mode :ensure t)

(use-package js-comint
  :ensure t
  :config
  (setq inferior-js-program-command "node"))

(use-package js2-mode :ensure t)

(use-package js2-refactor 
  :ensure t
  :config 
  (add-hook 'js2-mode-hook #'js2-refactor-mode))

(use-package flow-minor-mode
  :ensure t
  :config
  (add-hook 'js2-mode-hook 'flow-minor-enable-automatically)
  (with-eval-after-load 'flycheck
    (flycheck-add-mode 'javascript-flow 'flow-minor-mode)
    (flycheck-add-mode 'javascript-eslint 'flow-minor-mode)
    (flycheck-add-next-checker 'javascript-flow 'javascript-eslint)))

(use-package rainbow-delimiters :ensure t)

(use-package lsp-javascript-flow
  :after lsp-mode
	:ensure t
  :ensure-system-package
  ((flow-language-server . "npm i -g flow-language-server")
   (javascript-typescript-langserver . "npm i -g javascript-typescript-langserver"))
	:config
	(add-hook 'js-mode-hook #'lsp-javascript-flow-enable)
  ;; for rjsx-mode support
  (add-hook 'rjsx-mode #'lsp-javascript-flow-enable))

(use-package flycheck-flow
  :ensure t
  :config
  (add-hook 'javascript-mode-hook 'flycheck-mode))

(use-package company-flow
  :ensure t
  :config
  (eval-after-load 'company
    '(add-to-list 'company-backends 'company-flow)))

(use-package indium :ensure t)

(provide 'init-javascript)

;;; init-javascript.el ends here
