(load "~/.emacs.d/config/config.el")
(load-config "parameters")

;;enable quicklisp in slime mode.
(defvar *slime-helper-path*
  (concat *workspace* "/libs/quicklisp/slime-helper.el"))
(load (expand-file-name *slime-helper-path*))

;; set lisp implements on different platform.
(cond
 ((cygwin-p) (setq inferior-lisp-program "clisp"))
 ((windows-p) (setq inferior-lisp-program "wx86cl64"))
 (t (setq inferior-lisp-program "sbcl")))

;; slime bugs
(cond 
 ((windows-p) 
  (setq
   slime-backend 
   "C:/MinGW/local/Emacs/emacs-24.1/site-lisp/libs/slime/swank-loader.lisp")
  (load-file "C:/MinGW/local/Emacs/emacs-24.1/site-lisp/libs/slime/slime.el")
  (slime-setup '(slime-fancy)))
 (t 
  (require 'slime)
  (slime-setup)))
