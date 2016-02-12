;;; init-main.el --- MAIN
;;; Code:

;; (setq *user-site-lisp-path* (concat user-emacs-directory  "site-lisp/"))
(add-to-list 'load-path "~/.emacs.d/init/")
(add-to-list 'load-path "~/.emacs.d/site-lisp/")
;;(add-to-list 'load-path (concat user-emacs-directory  *user-site-lisp-path*))

;;; Commentary:
;; 

(require 'init-benchmarking)
(require 'init-elpa)
(require 'init-utils)


(require 'init-parameters)
(require 'init-system)
(require 'init-cygwin)
(require 'init-coding)
(require 'init-ui)
(require 'init-remote)
(require 'init-edit)
(require 'init-search)

(require 'init-ediff)
(require 'init-sr-speedbar)
(require 'init-eshell)
(require 'init-theme)
(require 'init-global-set-key)
(require 'init-dired)
(require 'init-uniquify)

(require 'init-irfc)
(require 'init-tags)
(require 'init-session)
(require 'init-multi-term)
(require 'init-shell)

(require 'init-cvs)
(require 'init-git)
(require 'init-hg)

(require 'init-compile)
(require 'init-ant)
(require 'init-xcscope)
(require 'init-cedet)
(require 'init-auto-complete)
(require 'init-company)
(require 'init-org)

(require 'init-regexp)
(require 'init-helm)
(require 'init-kill-ring)
;; (require 'init-ecb)
;; (require 'init-msvc)
(require 'init-projectile)
(require 'init-flycheck)
(require 'init-flymake)
(require 'init-yasnippet)

(require 'init-ess)
(require 'init-julia)
(require 'init-maxima)
(require 'init-axiom)

(require 'init-texinfo-mode)
(require 'init-sage-mode)
(require 'init-java)

(require 'init-slime)
(require 'init-lisp)
(require 'init-R)
(require 'init-octave)
(require 'init-cc-mode)
(require 'init-lex)
(require 'init-sl)
(require 'init-pascal)

(require 'init-erlang)
(require 'init-clojure)
(require 'init-haml)
(require 'init-python)
(require 'init-haskell)
(require 'init-javascript)
(require 'init-css)
(require 'init-ruby)
(require 'init-prolog)
(require 'init-ack)
(require 'init-sql)
(require 'init-go)

(require 'init-powershell)
(require 'init-dos)
(require 'init-csharp)
(require 'init-erc)
(require 'init-markdown)

(require 'init-csv)
(require 'init-php)
(require 'init-nodejs)
(require 'init-nav)
(require 'init-polymode)
(require 'init-nxml)
(require 'init-web)
(require 'init-vlf)
(require 'init-format)
(require 'init-view)

(require 'init-evil)
(require 'init-smart)

(provide 'init-main)

;;; init-main.el ends here
