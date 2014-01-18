(require-package 'slime)

;; enable quicklisp in slime mode.
(defvar *slime-helper-path* "~/quicklisp/slime-helper.el")
(load (expand-file-name *slime-helper-path*))

(setq inferior-lisp-program "sbcl")

(provide 'init-slime)

