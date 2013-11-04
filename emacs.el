;; Base configuration
(load "~/.emacs.d/config/config.el")
(load "~/.emacs.d/config/system.el")
(load-config "parameters")
(load-config "emacs-lisp-mode")
(load-config "ui")
(load-config "coding")

(load-config "sr-speedbar")
(load-config "linum")
(load-config "eshell")
(load-config "theme")
(load-config "global-set-key")

(load-config "org")
(load-config "uniquify")
(load-config "ess")
(load-config "julia")
(load-config "maxima")
(load-config "cedet")

(load-config "compile")

(load-config "whitespace")

(load-config "indent-tabs-mode")
(load-config "csharp")
(load-config "interactive-mode")
(load-config "python-mode")
(load-config "texinfo-mode")
(load-config "markdown-mode")
(load-config "sage-mode")
;;(load-config "emacs.js")

(load-config "rfcview")
(load-config "cygwin-mount")
;; xcscope
(require 'xcscope)

(load-config "jdee")

(load-config "highlight-line")
(load-config "epy")
;; for file in *
;; do
;;     mv $file ${file/%el/econf}
;; done

(load-config "nxhtml")

;; elpa pacakges
(load-config "package")
(load-config "multi-web-mode")
(load-config "helm")
(load-config "helm-R")
(load-config "helm-flymake")
(load-config "ecb")
(load-config "magit")
(load-config "session")
(load-config "w3m")
(load-config "yasnippet")
(load-config "slime")
(load-config "emms")
(load-config "powershell")
(load-config "octave-mod")
(load-config "csharpmode")
(load-config "ediff")
(load-config "erc")
(load-config "dired")
(load-config "gtags")
(load-config "auto-complete")
(load-config "cc-mode")
(load-config "irfc")
(load-config "js2mode")
(load-config "markdown")
(load-config "javascript")
