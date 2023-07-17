;;; init-main.el --- main -*- lexical-binding: t -*-
;;; Commentary:
;;

;;; Code:

(require 'init-system)
(require 'init-proxy)

(require 'init-elpa)

;; if session is install as an ELPA package,
;; it means that package-initialize must be called
;; before the customization file is loaded.
(load custom-file)

(require 'init-benchmarking)
(require 'init-parameters)
(require 'init-windows)
(require 'init-erc)
(require 'init-bookmark)
(require 'init-font)
(require 'init-edit)
(require 'init-misc)

(require 'init-global-set-key)
(require 'init-tags)
(require 'init-shell)
(require 'init-docker)
(require 'init-skeletor)


(require 'init-vc)
(require 'init-prog)
;; (require 'init-cedet)
(require 'init-org)

(require 'init-minibuffer)
(require 'init-snippets)
(require 'init-lint)
(require 'init-lsp)
(require 'init-dap)

(require 'init-ess)
(require 'init-math)

(require 'init-cc-mode)
(require 'init-rust)
(require 'init-lisp)
(require 'init-racket)
(require 'init-octave)

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
(require 'init-latex)
(require 'init-lua)
(require 'init-javascript)
(require 'init-flutter)
(require 'init-graphviz)

(require 'init-powershell)
(require 'init-dotnet)
(require 'init-pascal)
(require 'init-markup-lang)

(require 'init-polymode)
(require 'init-web)

(require 'init-ide)

(require 'init-theme)

; (require 'server)
; (unless (server-running-p)
;  (setq server-auth-dir (expand-file-name "~/.emacs.d/server"))
;  (server-start))

(provide 'init-main)

;;; init-main.el ends here
