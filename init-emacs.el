
;; ;;; init-emacs.el --- init
;; ;; Base configuration
;; ;;; Code:

(add-to-list 'load-path (concat user-emacs-directory  "init"))
(add-to-list 'load-path (concat user-emacs-directory  "site-lisp"))

;;; Commentary:
;;

(require 'init-benchmarking)
(require 'init-elpa)
(require 'init-utils)

(require 'init-parameters)
(require 'init-ui)
(require 'init-tabbar)
(require 'init-coding)

(require 'init-sr-speedbar)
(require 'init-linum)
(require 'init-eshell)
(require 'init-theme)
(require 'init-global-set-key)

(require 'init-cedet)
(require 'init-auto-complete)
(require 'init-org)
(require 'init-uniquify)
(require 'init-ess)
(require 'init-julia)
(require 'init-maxima)
;;(require 'init-axiom)
;;(require 'init-fricas)

(require 'init-compile)
(require 'init-whitespace)
(require 'init-texinfo-mode)
(require 'init-sage-mode)
(require 'init-xcscope)
(require 'init-jdee)
(require 'init-highlight-line)
(require 'init-epy)

(require 'init-ecb)
(require 'init-git)
(require 'init-slime)
(require 'init-lisp)
(require 'init-R)
(require 'init-octave-mod)
(require 'init-cc-mode)
(require 'init-dired)
(require 'init-tags)
(require 'init-multi-term)
(require 'init-erlang)
(require 'init-clojure)
(require 'init-haml)
(require 'init-python)
(require 'init-haskell)
(require 'init-javascript)
(require 'init-css)
(require 'init-ruby-mode)
(require 'init-prolog)
(require 'init-ack)
(require 'init-ant)
(require 'init-sql)

;; elpa pacakges
(require 'init-irfc)
(require 'init-flymake)
(require 'init-helm-flymake)
(require 'init-helm)
(require 'init-helm-R)
(require 'init-session)
(require 'init-w3m)
(require 'init-yasnippet)
(require 'init-emms)
(require 'init-powershell)
(require 'init-csharp-mode)
(require 'init-ediff)
(require 'init-erc)
(require 'init-markdown)
(require 'init-nxml)
(require 'init-mmm)
(require 'init-csv)
(require 'init-nodejs)
(require 'init-nav)

;;(require 'init-web-mode)

;; begin init-nxhtml
;; nxhtml is not in elpa
;;(require 'init-multi-web-mode)
;;(require 'init-nxhtml)
;; end init-nxhtml
;;; init-emacs.el ends here

(dolist (var (file-expand-wildcards "~/.emacs.d/init/*.el"))
  (let* ((file (expand-file-name var))
         (elcfile  (concat (file-name-sans-extension file) ".elc")))
    (if (file-exists-p elcfile) (byte-recompile-file file)
      (byte-compile-file file))))

(provide 'init-emacs)
