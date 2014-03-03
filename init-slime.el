(require-package 'slime)
(cond
 ((eq system-type 'gnu/linux)
  (defvar slime-helper-path "~/quicklisp/slime-helper.el")
  (load (expand-file-name slime-helper-path))
  (setq inferior-lisp-program "sbcl"))
 ((eq system-type 'cygwin)
  (setq inferior-lisp-program "clisp")
  (setq slime-contribs '(slime-fancy)))
 (t t))

(provide 'init-slime)

