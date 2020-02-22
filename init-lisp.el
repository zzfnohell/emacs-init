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
;; Enable desired features for all lisp modes
;; ----------------------------------------------------------------------------
(use-package rainbow-delimiters
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
  )

(use-package redshank
  :after (:all diminish)
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
      ;; (ac-emacs-lisp-mode-setup)
			)

    (defconst init-lisp/elispy-modes
      '(emacs-lisp-mode ielm-mode)
      "Major modes relating to elisp.")

    (defconst init-lisp/lispy-modes
      (append init-lisp/elispy-modes
              '(lisp-mode inferior-lisp-mode lisp-interaction-mode))
      "All lispy major modes.")

    (diminish 'redshank-mode)
    
    (dolist (hook (mapcar #'derived-mode-hook-name init-lisp/lispy-modes))
      (add-hook hook 'init-lisp/lisp-setup))

    (dolist (hook (mapcar #'derived-mode-hook-name init-lisp/elispy-modes))
      (add-hook hook 'init-lisp/emacs-lisp-setup))
    )
  )

(use-package eldoc-eval)

(use-package macrostep)

(setq auto-mode-alist (cons '("\\.el" . emacs-lisp-mode) auto-mode-alist))
(defvar *slime-helper-path*
  (expand-file-name "~/quicklisp/slime-helper.el"))

(use-package slime
  :init
	(setq inferior-lisp-program "sbcl")
  (setq slime-contribs '(slime-fancy))
	:config
	(when (file-exists-p *slime-helper-path*)
    ;; located in quicklisp install directory
		(load *slime-helper-path*)))

(use-package slime-company)

;; (use-package ac-slime
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

