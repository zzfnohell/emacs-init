;;; init-lisp.el --- LISP
;; packages required in hooks

;;; Commentary:
;;

;;; Code:
(defconst init-lisp/elispy-modes
  '(emacs-lisp-mode ielm-mode)
  "Major modes relating to elisp.")

(defconst init-lisp/lispy-modes
  (append init-lisp/elispy-modes
          '(lisp-mode inferior-lisp-mode lisp-interaction-mode))
  "All lispy major modes.")


(use-package ansi
  :ensure t)

(use-package paredit
  :ensure t
  :hook
  (lisp-mode . enable-paredit-mode)
  (inferior-lisp-mode . enable-paredit-mode)
  (lisp-interaction-mode . enable-paredit-mode)
  (emacs-lisp-mode . enable-paredit-mode)
  (ielm-mode .enable-paredit-mode))

(use-package lispy
  :ensure t
  :defer t
  :hook
  (emacs-lisp-mode . (lambda () (unless (string= (buffer-name) "*scratch*")
                             (lispy-mode 1))))
  :config
  (message "config lispy"))

(use-package diminish
  :ensure t
  :config
  (diminish 'visual-line-mode))

(use-package dimmer
  :ensure t
  :custom (dimmer-fraction 0.3)
  :config (dimmer-mode))

(use-package lively :ensure t)

(require 'derived)

(use-package pretty-mode
  :ensure t
  :hook
  (emacs-lisp-mode .  turn-on-pretty-mode))

(use-package elisp-refs
  :ensure t
  :defer t)

(use-package elisp-def
  :ensure t
  :commands elisp-def
  :config
  (dolist (hook '(emacs-lisp-mode-hook ielm-mode-hook))
    (add-hook hook #'elisp-def-mode)))

(use-package elisp-depmap
  :ensure t
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
  :defer t
  :commands elpl)

;; ----------------------------------------------------------------------------
;; Hippie-expand
;; ----------------------------------------------------------------------------
(defun set-up-hippie-expand-for-elisp ()
  "Locally set `hippie-expand' completion functions for use with Emacs Lisp."
  (setq-local hippie-expand-try-functions-list
              (append '('try-complete-lisp-symbol
                        'try-complete-lisp-symbol-partially)
                      hippie-expand-try-functions-list)))

;; ----------------------------------------------------------------------------
;; Enable desired features for all lisp modes
;; ----------------------------------------------------------------------------
(defun init-lisp/lisp-setup ()
  "Enable features useful in any Lisp mode."
  (turn-on-eldoc-mode)
  (redshank-mode))

(defun init-lisp/emacs-lisp-setup ()
  "Enable features useful when working with elisp."
  (set-up-hippie-expand-for-elisp)
  (turn-on-eldoc-mode)
  ;; (ac-emacs-lisp-mode-setup)
  )


(use-package redshank
  :ensure t
  :after (:all diminish)
  :hook
  (lisp-mode . init-lisp/lisp-setup)
  (inferior-lisp-mode . init-lisp/lisp-setup)
  (lisp-interaction-mode . init-lisp/lisp-setup)
  (emacs-lisp-mode . init-lisp/emacs-lisp-setup)
  (ielm-mode . init-lisp/emacs-lisp-setup)
  :config
  (diminish 'redshank-mode))

(use-package eldoc-eval
  :ensure t)

(use-package macrostep
  :ensure t)

(setq auto-mode-alist (cons '("\\.el" . emacs-lisp-mode) auto-mode-alist))

(use-package slime
  :ensure t
  :defer t
  :commands slime
  :config
  (let ((slime-helper-path (expand-file-name "~/quicklisp/slime-helper.el")))
    (when (file-exists-p slime-helper-path)
      ;; located in quicklisp install directory
      (load slime-helper-path)))
  (require 'slime-autoloads)

  (setq inferior-lisp-program "sbcl")
  (setq slime-lisp-implementations
        '((sbcl ("sbcl") :coding-system utf-8-unix)
          (cmucl ("cmucl" "-quiet"))))

  (use-package slime-company
    :ensure t
    :demand t))

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

(use-package aggressive-indent
  :ensure t
  :config
  (add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode)
  (add-hook 'css-mode-hook #'aggressive-indent-mode))


(use-package clojure-mode
  :ensure t
  :defer t
  :hook
  (clojure-mode . paredit-mode))

(use-package cljsbuild-mode
  :ensure t)

(use-package cider
  :ensure t
  :commands cider)

(use-package geiser
  :ensure t)

(use-package racket-mode
  :ensure t
  :mode "\\.rkt\\'"
  :hook ((racket-mode . racket-xp-mode)))

(message "loading init-lisp done.")

(provide 'init-lisp)

;;; init-lisp.el ends here
