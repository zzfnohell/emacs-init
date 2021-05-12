;;; init-prog.el --- Prog Mode



;;; Commentary:
;; 

;;; Code:

(use-package rainbow-delimiters
	:ensure t
	:config
	(add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package hideshow
  :ensure t
  :config
	;; Fix XML folding
	(add-to-list 'hs-special-modes-alist
							 (list 'nxml-mode
										 "<!--\\|<[^/>]*[^/]>"
										 "-->\\|</[^/>]*[^/]>"
										 "<!--"
										 'nxml-forward-element
										 nil))
	
	;; Fix HTML folding
	(dolist (mode '(sgml-mode
									html-mode
									html-erb-mode))
		(add-to-list 'hs-special-modes-alist
								 (list mode
											 "<!--\\|<[^/>]*[^/]>"
											 "-->\\|</[^/>]*[^/]>"
											 "<!--"
											 'sgml-skip-tag-forward
											 nil)))
	(add-hook 'nxml-mode-hook 'hs-minor-mode)
  (add-hook 'prog-mode-hook 'hs-minor-mode))

(require 'compile)
(setq compilation-disable-input nil)
(setq compilation-scroll-output t)
(setq mode-compile-always-save-buffer-p t)

(use-package emr
  :config
  (progn
    (autoload 'emr-show-refactor-menu "emr")
    (define-key prog-mode-map (kbd "M-RET") 'emr-show-refactor-menu)
    (eval-after-load "emr" '(emr-initialize))))

(use-package srefactor
  :config
  (progn
    (require 'srefactor)
    (require 'srefactor-lisp)
    
    ;; OPTIONAL: ADD IT ONLY IF YOU USE C/C++. 
    ;; (semantic-mode 1) ;; -> this is optional for Lisp
    (define-key c-mode-map (kbd "M-RET") 'srefactor-refactor-at-point)
    (define-key c++-mode-map (kbd "M-RET") 'srefactor-refactor-at-point)
    (global-set-key (kbd "M-RET o") 'srefactor-lisp-one-line)
    (global-set-key (kbd "M-RET m") 'srefactor-lisp-format-sexp)
    (global-set-key (kbd "M-RET d") 'srefactor-lisp-format-defun)
    (global-set-key (kbd "M-RET b") 'srefactor-lisp-format-buffer)))

(require 'display-fill-column-indicator)
(setq display-fill-column-indicator-column 120)
(defun init-ui/enable-display-fill-column ()
	(display-fill-column-indicator-mode))

(add-hook 'prog-mode-hook #'init-ui/enable-display-fill-column)

(use-package bison-mode
  :mode (("\\.lex\\'" . bison-mode)
         ("\\.yy\\'" . bison-mode)
         ("\\.y\\'" . bison-mode)))

(use-package lex :ensure t)
(use-package peg :ensure t)

(message "loading init-prog done.")

(provide 'init-prog)

;;; init-prog.el ends here
