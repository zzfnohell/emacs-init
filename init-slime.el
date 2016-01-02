;;; init-slime.el --- SLIME

;; use slime from quicklisp

;;; Commentary:
;; 

;;; Code:

(defvar slime-helper-path "~/quicklisp/slime-helper.el")
(load (expand-file-name slime-helper-path))

;; located in quicklisp install directory
(require 'slime)

(setq inferior-lisp-program "sbcl")

(slime-setup)

(require-package 'ac-slime)
(require 'ac-slime)
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'slime-repl-mode))

(provide 'init-slime)

;;; init-slime.el ends here
