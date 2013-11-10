;;; init-emacs.el --- init
;; Base configuration
;;; Code:

(add-to-list 'load-path (concat user-emacs-directory  "config"))

;;; Commentary:
;;

(require 'init-benchmarking) ;; Measure startup time

(require 'parameters)
(require 'emacs-lisp-mode)
(require 'ui)
(require 'coding)

(require 'sr-speedbar)
(require 'linum)
(require 'eshell)
(require 'theme)
(require 'global-set-key)

(require 'cedet)
(require 'org)
(require 'uniquify)
(require 'ess)
(require 'julia)
(require 'maxima)

(require 'compile)
(require 'whitespace)
(require 'indent-tabs-mode)
(require 'interactive-mode)
(require 'python-mode)
(require 'texinfo-mode)
(require 'markdown-mode)
(require 'sage-mode)
;;(require 'rfcview)
(require 'cygwin-mount)
(require 'xcscope)
(require 'jdee)
(require 'highlight-line)
(require 'epy)

;; elpa pacakges
(require 'package)
(require 'flymake)
(require 'helm)
(require 'helm-R)
(require 'helm-flymake)
(require 'ecb)
(require 'magit)
(require 'session)
(require 'w3m)
(require 'yasnippet)
(require 'slime)
(require 'emms)
(require 'powershell)
(require 'octave-mod)
(require 'csharp-mode)
(require 'ediff)
(require 'erc)
(require 'dired)
(require 'gtags)
(require 'auto-complete)
(require 'cc-mode)
(require 'markdown)
(require 'javascript)
(require 'nodejs)

;;; init-emacs.el ends here
