;;; init-lisp.el --- LISP
;; packages required in hooks

;;; Commentary:
;; 

;;; Code:

(use-package paredit)
(use-package lispy)
(use-package diminish)
(use-package lively)
(require 'derived)

(use-package pretty-mode
  :defer t
  :config (autoload 'turn-on-pretty-mode "pretty-mode"))


;; ----------------------------------------------------------------------------
;; Hippie-expand
;; ----------------------------------------------------------------------------
(defun set-up-hippie-expand-for-elisp ()
  "Locally set `hippie-expand' completion functions for use with Emacs Lisp."
  (make-local-variable 'hippie-expand-try-functions-list)
  (add-to-list 'hippie-expand-try-functions-list 'try-complete-lisp-symbol t)
  (add-to-list 'hippie-expand-try-functions-list 'try-complete-lisp-symbol-partially t))

;; ----------------------------------------------------------------------------
;; Highlight current sexp
;; ----------------------------------------------------------------------------
(use-package hl-sexp
  :defer t
  :init
  ;; Prevent flickery behaviour due to hl-sexp-mode unhighlighting before each command
  (after-load 'hl-sexp
    (defadvice hl-sexp-mode (after unflicker (&optional turn-on) activate)
      (when turn-on
        (remove-hook 'pre-command-hook #'hl-sexp-unhighlight)))))


;; ----------------------------------------------------------------------------
;; Enable desired features for all lisp modes
;; ----------------------------------------------------------------------------
(use-package rainbow-delimiters)
(use-package redshank
  :defer t
  :after (diminish)
  :init
  (after-load 'redshank
    (diminish 'redshank-mode))
  :config
  (progn
    (defun init-lisp/lisp-setup ()
      "Enable features useful in any Lisp mode."
      (rainbow-delimiters-mode t)
      (enable-paredit-mode)
      (turn-on-eldoc-mode)
      (redshank-mode))

    (defun init-lisp/emacs-lisp-setup ()
      "Enable features useful when working with elisp."
      (set-up-hippie-expand-for-elisp)
      (ac-emacs-lisp-mode-setup))

    (defconst init-lisp/elispy-modes
      '(emacs-lisp-mode ielm-mode)
      "Major modes relating to elisp.")

    (defconst init-lisp/lispy-modes
      (append init-lisp/elispy-modes
              '(lisp-mode inferior-lisp-mode lisp-interaction-mode))
      "All lispy major modes.")


    (dolist (hook (mapcar #'derived-mode-hook-name init-lisp/lispy-modes))
      (add-hook hook 'init-lisp/lisp-setup))

    (dolist (hook (mapcar #'derived-mode-hook-name init-lisp/elispy-modes))
      (add-hook hook 'init-lisp/emacs-lisp-setup))
    )
  )


(use-package eldoc-eval)
(use-package macrostep)


(setq auto-mode-alist (cons '("\\.el" . emacs-lisp-mode) auto-mode-alist))
(defvar *slime-helper-path* "~/quicklisp/slime-helper.el")


(use-package slime
	:after (:all slime-company)
	:ensure t
	:demand t
	:config
	(when (file-exists-p *slime-helper-path*)
		(load (expand-file-name *slime-helper-path*))
		;; located in quicklisp install directory
		(setq inferior-lisp-program "sbcl")
		(slime-setup '(slime-company))
		)
	)

(use-package slime-company
	:ensure t
	:demand t
	:after (:all company)
	)

;; (use-package ac-slime
;; 	:ensure t
;; 	:after (:all slime cl-lib auto-complete)
;; 	:config
;; 	(progn 
;; 		(add-hook 'slime-mode-hook 'set-up-slime-ac)
;; 		(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
;; 		(eval-after-load "auto-complete"
;; 			'(add-to-list 'ac-modes 'slime-repl-mode))
;; 		)
;; 	)


(provide 'init-lisp)

;;; init-lisp.el ends here
