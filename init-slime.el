;; enable quicklisp in slime mode.
(defvar *slime-helper-path*
  (concat *workspace* "/quicklisp/slime-helper.el"))

(load (expand-file-name *slime-helper-path*))

;; set lisp implements on different platforms.
(setq inferior-lisp-program "sbcl")

(provide 'init-slime)
