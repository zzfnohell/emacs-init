;;; init-javascript.el --- JavaScript
;; Javascript

;;; Commentary:
;;

;;; Code:

(use-package json-mode :ensure t)

(use-package js-comint
  :ensure t
  :config
  (setq inferior-js-program-command "node")
  )

(use-package rainbow-delimiters :ensure t)

;; npm install -g flow-language-server
(use-package lsp-javascript-flow
  :after lsp-mode
	:ensure t
	:config
	(add-hook 'js-mode-hook #'lsp-javascript-flow-enable)
  ;; for rjsx-mode support
  ;; (add-hook 'rjsx-mode #'lsp-javascript-flow-enable)
	)

(load-file "~/.emacs.d/init/site-lisp/flow-for-emacs/flow.el")

(use-package indium :ensure t)

(provide 'init-javascript)

;;; init-javascript.el ends here
