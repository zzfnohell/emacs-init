;;; init-javascript.el --- JavaScript
;; Javascript

;;; Commentary:
;; 

;;; Code:

(use-package json-mode)

(req-package js2-mode
  :config

    (defcustom preferred-javascript-mode
      (first (remove-if-not #'fboundp '(js2-mode js-mode)))
      "Javascript mode to use for .js files."
      :type 'symbol
      :group 'programming
      :options '(js2-mode js-mode))
		
    (defvar preferred-javascript-indent-level 2)
    (setq js2-use-font-lock-faces t
          js2-mode-must-byte-compile nil
          js2-basic-offset preferred-javascript-indent-level
          js2-indent-on-enter-key t
          js2-auto-indent-p t
          js2-bounce-indent-p t
          js2-basic-offset 2)

		(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
		;; Better imenu
		(add-hook 'js2-mode-hook #'js2-imenu-extras-mode)
    )

;; (use-package ac-js2
;;   :config
;;   ;;(setq ac-js2-evaluate-calls t)
;;   ;;(setq ac-js2-external-libraries '(/full/path/to/a/library.js))
;;   (add-hook 'js2-mode-hook 'ac-js2-mode)
;;   )


(req-package js2-refactor
	:require js2-mode
	:config
	(add-hook 'js2-mode-hook #'js2-refactor-mode)
	(js2r-add-keybindings-with-prefix "C-c C-r")
	(define-key js2-mode-map (kbd "C-k") #'js2r-kill)
	)

(req-package xref-js2
	:require js2-mode
	:config
	;; js-mode (which js2 is based on) binds "M-." which conflicts with xref, so
	;; unbind it.
	(define-key js-mode-map (kbd "M-.") nil)
	
	(add-hook 'js2-mode-hook
						(lambda ()
							(add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))
	)
	

(req-package tern
  :config
  (progn
    (setq tern-command '("tern" "--no-port-file" "--persistent"))
    )
  )

(req-package company-tern
	:require company tern js2-mode
	:config
	(add-to-list 'company-backends 'company-tern)
	(add-hook 'js2-mode-hook (lambda ()
														 (tern-mode)
														 (company-mode)))
                           
	;; Disable completion keybindings, as we use xref-js2 instead
	(define-key tern-mode-keymap (kbd "M-.") nil)
	(define-key tern-mode-keymap (kbd "M-,") nil)
	)

;; (req-package tern-auto-complete
;;   :config
;;   (progn
;;     (add-hook 'js2-mode-hook
;;               '(lambda ()
;;                  (define-key js2-mode-map (kbd "TAB") 'indent-for-tab-command)
;;                  (setq mode-name "JS2")
;;                  (js2-imenu-extras-setup)
;;                  (tern-mode t)
;;                  (tern-ac-setup)))))



;; Need to first remove from list if present,
;; since elpa adds entries too, which may be in an arbitrary order
(eval-when-compile (require 'cl))
(setq auto-mode-alist
      (cons `("\\.js\\(\\.erb\\)?\\'" . ,preferred-javascript-mode)
            (loop for entry in auto-mode-alist
                  unless (eq preferred-javascript-mode (cdr entry))
                  collect entry)))


;; js-mode
(setq js-indent-level preferred-javascript-indent-level)
(add-to-list 'interpreter-mode-alist (cons "node" preferred-javascript-mode))

(use-package js-comint)
(setq inferior-js-program-command "js")


(use-package rainbow-delimiters)
(use-package coffee-mode
  :config
  (progn
    ;; Coffeescript
    (after-load 'coffee-mode
      (setq coffee-js-mode preferred-javascript-mode
            coffee-tab-width preferred-javascript-indent-level))
    
    (add-to-list 'auto-mode-alist '("\\.coffee\\.erb\\'" . coffee-mode))
    ))


(req-package skewer-mode :config (skewer-setup))

;; Node.js
(use-package nodejs-repl)
(use-package sws-mode
  :config (add-to-list 'auto-mode-alist '("\\.styl$" . sws-mode)))
(use-package jade-mode
  :config (add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode)))


(req-package indium
	:init
	(message "init indium")
	:config
	(message "config indium"))

(provide 'init-javascript)

;;; init-javascript.el ends here
