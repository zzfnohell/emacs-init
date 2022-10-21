;;; init-lisp.el --- LISP
;; packages required in hooks

;;; Commentary:
;;

;;; Code:

(use-package paredit
  :ensure t)

(use-package lispy :ensure t)

(use-package diminish :ensure t)

(use-package lively :ensure t)

(require 'derived)

(use-package pretty-mode
  :ensure t
  :config
  (autoload 'turn-on-pretty-mode "pretty-mode"))

(use-package elisp-refs
  :ensure t
  :defer t)

(use-package elisp-def
  :ensure t
  :defer t
  :config
  (dolist (hook '(emacs-lisp-mode-hook ielm-mode-hook))
    (add-hook hook #'elisp-def-mode)))

(use-package elisp-depmap
  :ensure t
  :defer t
  :bind
  (("C-c M-d" . elisp-depmap-graphviz-digraph)
   ("C-c M-g" . elisp-depmap-graphviz)
   ("C-c M-s" . elisp-depmap-makesummarytable))
  :config
  ((elisp-depmap-exec-file "~/graphviz2.dot")))

(use-package elisp-lint
  :ensure t
  :defer t)

(use-package elpl
  :ensure t
  :defer t)

(use-package elsa
  :ensure t
  :defer t)
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
  :ensure t
  :defer t
  :init
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package redshank
  :ensure t
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

(use-package eldoc-eval
  :ensure t)

(use-package macrostep
  :ensure t)

(setq auto-mode-alist (cons '("\\.el" . emacs-lisp-mode) auto-mode-alist))

(use-package slime-company
  :ensure t)

(use-package slime
  :ensure t
  :defer t
  :config
  (let ((slime-helper-path (expand-file-name "~/quicklisp/slime-helper.el")))
    (when (file-exists-p slime-helper-path)
      ;; located in quicklisp install directory
      (load slime-helper-path)))
  (require 'slime-autoloads)
  (setq slime-lisp-implementations
        '((cmucl ("cmucl" "-quiet"))
          (sbcl ("sbcl") :coding-system utf-8-unix)))
  (setq inferior-lisp-program "sbcl"))

;; (use-package ac-slime
;;  :after (:all slime cl-lib auto-complete)
;;  :config
;;  (progn
;;    (add-hook 'slime-mode-hook 'set-up-slime-ac)
;;    (add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
;;    (eval-after-load "auto-complete"
;;      '(add-to-list 'ac-modes 'slime-repl-mode))
;;    )
;;  )

(defun init-lisp/append-elisp-backends ()
  (let ((mode-backends (make-local-variable 'company-backends)))
    (add-to-list mode-backends '(company-elisp company-dabbrev))))

(add-hook 'emacs-mode-hook #'init-lisp/append-elisp-backends)

(message "loading init-lisp done.")

(provide 'init-lisp)

;;; init-lisp.el ends here

