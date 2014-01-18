(cond
 ((eq system-type 'gnu/linux)
  (defvar slime-helper-path "~/quicklisp/slime-helper.el")
  (load (expand-file-name slime-helper-path))
  (setq inferior-lisp-program "sbcl"))
 (t t))

(provide 'init-slime)

