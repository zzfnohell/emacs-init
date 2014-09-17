(require-package 'slime)
(require 'slime)

(setq inferior-lisp-program "sbcl")

(defvar slime-helper-path "~/quicklisp/slime-helper.el")
(if (file-exists-p slime-helper-path)
	(load (expand-file-name slime-helper-path)))
(slime-setup)

(require-package 'ac-slime)
(require 'ac-slime)
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'slime-repl-mode))

(provide 'init-slime)

