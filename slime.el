(load "~/.emacs.d/config/config.el")
(load-config "parameters")

;;enable quicklisp in slime mode.
(defvar *slime-helper-path*
  (concat *workspace* "/libs/quicklisp/slime-helper.el"))
(load (expand-file-name *slime-helper-path*))
;; there is not sbcl for cygwin,but clisp is also an excellent interpreter.
(cond
 ((cygwin-p) (setq inferior-lisp-program "clisp"))
 ((windows-p) (setq inferior-lisp-program "wx86cl64"))
 (t (setq inferior-lisp-program "sbcl")))

(require 'slime)
