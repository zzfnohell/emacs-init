;;; init-main.el --- MAIN
;;; Commentary:
;;

;;; Code:

;; (setq *user-site-lisp-path* (concat user-emacs-directory  "site-lisp/"))
(add-to-list 'load-path "~/.emacs.d/init/")
(add-to-list 'load-path "~/.emacs.d/site-lisp/")
;; (add-to-list 'load-path (concat user-emacs-directory  *user-site-lisp-path*))

(require 'init-system)

(require 'server)
(unless (server-running-p)
  (setq server-auth-dir (expand-file-name "~/.emacs.d/server"))
  (server-start))

(require 'init-proxy)
(require 'init-elpa)
(require 'init-benchmarking)
(require 'init-utils)

(require 'init-parameters)
(require 'init-coding)
(require 'init-edit)
(require 'init-search)
(require 'init-purpose)

(require 'init-ediff)
(require 'init-theme)
(require 'init-global-set-key)
(require 'init-dired)
(require 'init-uniquify)

(require 'init-tags)
(require 'init-session)
(require 'init-multi-term)
(require 'init-shell)

(require 'init-skeletor)

(require 'init-vc)
(require 'init-compile)
(require 'init-debugger)
(require 'init-prog)
(require 'init-xcscope)
(require 'init-cedet)
(require 'init-auto-complete)
(require 'init-company)
(require 'init-org)

(require 'init-regexp)
(require 'init-helm)
(require 'init-ivy)
(require 'init-projectile)
(require 'init-flycheck)
(require 'init-flymake)
(require 'init-yasnippet)
(require 'init-lsp)

(require 'init-ess)
(require 'init-maxima)
(require 'init-axiom)
(require 'init-proof)

(require 'init-cc-mode)
(require 'init-rust)
(require 'init-lisp)
(require 'init-racket)
(require 'init-octave)
(require 'init-lex)
(require 'init-sl)

(require 'init-sage-mode)
(require 'init-java)
(require 'init-scala)

(require 'init-ocaml)
(require 'init-erlang)
(require 'init-clojure)
(require 'init-python)
(require 'init-haskell)
(require 'init-ruby)
(require 'init-prolog)
(require 'init-sql)
(require 'init-go)
(require 'init-php)
(require 'init-lua)
(require 'init-javascript)

(require 'init-powershell)
(require 'init-dos)
(require 'init-csharp)
(require 'init-pascal)
(require 'init-erc)
(require 'init-markdown)
(require 'init-ml)

(require 'init-nav)

(require 'init-polymode)
(require 'init-web)

(require 'init-format)
(require 'init-development)

(require 'init-view)

(require 'custom-template)

(provide 'init-main)

;;; init-main.el ends here
