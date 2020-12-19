;;; init-main.el --- MAIN
;;; Commentary:
;;

;;; Code:
(add-to-list 'load-path "~/.emacs.d/init/")

(let ((default-directory "~/.emacs.d/site-lisp/"))
  (normal-top-level-add-subdirs-to-load-path))

(require 'init-system)
(require 'init-proxy)

(require 'init-elpa)

(require 'init-benchmarking)
(require 'init-utils)
(require 'init-monitor)
(require 'server)
;; (unless (server-running-p)
;;  (setq server-auth-dir (expand-file-name "~/.emacs.d/server"))
;;  (server-start))

(require 'init-parameters)
(require 'init-coding-system)
(require 'init-edit)
(require 'init-dired)

(require 'init-rfc)
(require 'init-ediff)
(require 'init-theme)
(require 'init-global-set-key)
(require 'init-uniquify)
(require 'init-tramp)

(require 'init-tags)
(require 'init-session)
(require 'init-multi-term)
(require 'init-shell)
(require 'init-docker)
(require 'init-skeletor)

(require 'init-vc)
(require 'init-compile)
(require 'init-prog)
(require 'init-xcscope)
(require 'init-cedet)
(require 'init-auto-complete)
(require 'init-company)
(require 'init-org)

(require 'init-regexp)
(require 'init-ivy)
(require 'init-flycheck)
(require 'init-flymake)
(require 'init-yasnippet)
(require 'init-lsp)
(require 'init-dap)

(require 'init-ess)
(require 'init-julia)
(require 'init-maxima)
(require 'init-axiom)
(require 'init-proof)

(require 'init-cc-mode)
(require 'init-rust)
(require 'init-lisp)
(require 'init-racket)
(require 'init-octave)
(require 'init-lex)

(require 'init-grammar)
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
(require 'init-flutter)

(require 'init-powershell)
(require 'init-dos)
(require 'init-csharp)
(require 'init-pascal)
(require 'init-erc)
(require 'init-markup-lang)
(require 'init-uml)

(require 'init-nav)

(require 'init-polymode)
(require 'init-web)

(require 'init-format)
(require 'init-development)

(require 'init-view)
(require 'init-tools)
;; (require 'custom-template)


(provide 'init-main)

;;; init-main.el ends here
