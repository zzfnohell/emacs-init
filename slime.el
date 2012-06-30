;;enable quicklisp in slime mode.
(defvar *slime-helper-path*
  (concat *workspace* "/libs/quicklisp/slime-helper.el"))
(load (expand-file-name *slime-helper-path*))
;; there is not sbcl for cygwin,but clisp is also an excellent interpreter.
(if (cygwin-p)
    (setq inferior-lisp-program "clisp") (setq inferior-lisp-program "sbcl"))

(require 'slime)
