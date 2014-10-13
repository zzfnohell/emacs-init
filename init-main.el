;;; init-main.el --- MAIN
;;; Code:

(add-to-list 'load-path (concat user-emacs-directory  "init"))
(add-to-list 'load-path (concat user-emacs-directory  "site-lisp"))

;;; Commentary:
;; 

(require 'init-benchmarking)
(require 'init-elpa)
(require 'init-utils)

(require 'init-parameters)
(require 'init-system)
(require 'init-coding)
(require 'init-ui)
(require 'init-tabbar)

(require 'init-emms)

(require 'init-ediff)
(require 'init-highlight-line)
(require 'init-whitespace)
(require 'init-sr-speedbar)
(require 'init-linum)
(require 'init-eshell)
(require 'init-theme)
(require 'init-global-set-key)
(require 'init-dired)
(require 'init-uniquify)

(require 'init-irfc)
(require 'init-tags)
(require 'init-session)
(require 'init-w3m)
(require 'init-multi-term)

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
(require 'init-ecb)
(require 'init-flycheck)
(require 'init-yasnippet)

(require 'init-ess)
(require 'init-julia)
(require 'init-maxima)
;;(require 'init-axiom)
;;(require 'init-fricas)

(require 'init-texinfo-mode)
(require 'init-sage-mode)
(require 'init-java)

(require 'init-slime)
(require 'init-lisp)
(require 'init-R)
(require 'init-octave-mod)
(require 'init-cc-mode)
(require 'init-sl)

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

(require 'init-powershell)
(require 'init-dos)
(require 'init-csharp-mode)
(require 'init-erc)
(require 'init-markdown)

(require 'init-csv)
(require 'init-nodejs)
(require 'init-nav)
(require 'init-polymode)
(require 'init-nxml)
(require 'init-multi-web-mode)

(provide 'init-main)

;;; init-main.el ends here
