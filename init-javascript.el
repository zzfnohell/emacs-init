;;; init-javascript.el --- JavaScript
;; Javascript

;;; Commentary:
;;

;;; Code:

(use-package json-mode :ensure t)

;; (use-package js2-mode
;;   :ensure t
;;   :mode ("\\.js\\'" . js2-mode)
;;   :config
;;   (defcustom preferred-javascript-mode
;;     (first (remove-if-not #'fboundp '(js2-mode js-mode)))
;;     "Javascript mode to use for .js files."
;;     :type 'symbol
;;     :group 'programming
;;     :options '(js2-mode js-mode))

;;   (defvar preferred-javascript-indent-level 2)
;;   (setq js2-use-font-lock-faces t
;;         js2-mode-must-byte-compile nil
;;         js2-basic-offset preferred-javascript-indent-level
;;         js2-indent-on-enter-key t
;;         js2-auto-indent-p t
;;         js2-bounce-indent-p t
;;         js2-basic-offset 2)

;;   ;; Better imenu
;;   (add-hook 'js2-mode-hook #'js2-imenu-extras-mode)

;;   ;; Need to first remove from list if present,
;;   ;; since elpa adds entries too, which may be in an arbitrary order
;;   (eval-when-compile (require 'cl))
;;   (setq auto-mode-alist
;;         (cons `("\\.js\\(\\.erb\\)?\\'" . ,preferred-javascript-mode)
;;               (loop for entry in auto-mode-alist
;;                     unless (eq preferred-javascript-mode (cdr entry))
;;                     collect entry)))
;;   ;; js-mode
;;   (setq js-indent-level preferred-javascript-indent-level)
;;   (add-to-list 'interpreter-mode-alist
;;                (cons "node" preferred-javascript-mode))
;;   )


;; (use-package js2-refactor
;;   :after js2-mode
;;   :ensure t
;;   :config
;;   (add-hook 'js2-mode-hook #'js2-refactor-mode)
;;   (js2r-add-keybindings-with-prefix "C-c C-r")
;;   (define-key js2-mode-map (kbd "C-k") #'js2r-kill)
;;   )

;; (use-package xref-js2
;;   :after js2-mode
;;   :ensure t
;;   :config
;;   ;; js-mode (which js2 is based on) binds "M-." which conflicts with xref, so
;;   ;; unbind it.
;;   (define-key js-mode-map (kbd "M-.") nil)

;;   (add-hook 'js2-mode-hook
;;             (lambda ()
;;               (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))
;;   )



(use-package tern
  :ensure t
  ;;  :ensure-system-package (tern . "npm i -g tern"))
  :config
  (setq tern-command '("tern" "--no-port-file" "--persistent"))
  )

(use-package company-tern
  :after (:all company tern)
  :ensure t
  :config
  (add-to-list 'company-backends 'company-tern)
  ;; (add-hook 'js2-mode-hook (lambda ()
  ;;                            (tern-mode)
  ;;                            (company-mode)))

  ;; Disable completion keybindings, as we use xref-js2 instead
  ;; (define-key tern-mode-keymap (kbd "M-.") nil)
  ;; (define-key tern-mode-keymap (kbd "M-,") nil)
  )

;; (use-package tern-auto-complete
;;   :config
;;   (progn
;;     (add-hook 'js2-mode-hook
;;               '(lambda ()
;;                  (define-key js2-mode-map (kbd "TAB") 'indent-for-tab-command)
;;                  (setq mode-name "JS2")
;;                  (js2-imenu-extras-setup)
;;                  (tern-mode t)
;;                  (tern-ac-setup)))))

(use-package js-comint
  :ensure t
  :config
  (setq inferior-js-program-command "node")
  )

(use-package rainbow-delimiters :ensure t)

(use-package skewer-mode
  :ensure t
  :config
  (skewer-setup)
  ;;   (add-hook 'js2-mode-hook 'skewer-mode)
  (add-hook 'js-mode-hook 'skewer-mode)
  (add-hook 'css-mode-hook 'skewer-css-mode)
  (add-hook 'html-mode-hook 'skewer-html-mode)
  )

;; Node.js
(use-package nodejs-repl :ensure t)

(use-package sws-mode
  :ensure t
  :mode ("\\.styl$" . sws-mode))

(use-package jade-mode
  :ensure t
  :mode ("\\.jade$" . jade-mode)
  )

;; (use-package rjsx-mode :ensure t)

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
