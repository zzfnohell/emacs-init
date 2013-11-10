;; enable quicklisp in slime mode.
(defvar *slime-helper-path*
  (concat *workspace* "/quicklisp/slime-helper.el"))

(load (expand-file-name *slime-helper-path*))

;; set lisp implements on different platforms.
 (cond
  ((cygwin-p) (setq inferior-lisp-program "clisp"))
  ((windows-p) (setq inferior-lisp-program "wx86cl64"))
  (t (setq inferior-lisp-program "sbcl")))

;; slime bugs
;; (cond 
;;  ((windows-p)
;;   (setq
;;    slime-backend
;;    "~/.emacs.d/site-lisp/slime/swank-loader.lisp")
;;   (load-file "~/.emacs.d/site-lisp/slime/slime.el")
;;   (slime-setup '(slime-fancy slime-asdf)))
;;  (t
;;   (setq
;;    slime-backend
;;    "~/.emacs.d/site-lisp/slime/swank-loader.lisp")
;;   (load-file "~/.emacs.d/site-lisp/slime/slime.el")
;;   (slime-setup '(slime-fancy slime-asdf))))
\n(provide \'init-slime.el)
