;;; init-csharp.el --- CSharp

;;; Commentary:
;; 


;;; Code:

(require 'cc-mode)
(require-package 'csharp-mode)
(autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)

(require-package 'yasnippet)
(defun my-csharp-mode-fn ()
     "function that runs when csharp-mode is initialized for a buffer."
     (turn-on-auto-revert-mode)
     (setq indent-tabs-mode nil)
     (yas-minor-mode-on))

(require 'json)
(require 'cl-lib)
(require 'files)
(require 'ido)
(require 'thingatpt)
(require 'dash)
(require 'compile)
(require 'dired)
(require 'popup)
(require 'etags)
(require 'flycheck)

(require-package 'omnisharp)
(require 'omnisharp-utils)
(require 'omnisharp-server-actions)
(require 'omnisharp-auto-complete-actions)

(defgroup omnisharp ()
  "Omnisharp-emacs is a port of the awesome OmniSharp server to
the Emacs text editor. It provides IDE-like features for editing
files in C# solutions in Emacs, provided by an OmniSharp server
instance that works in the background."
  :group 'external
  :group 'csharp)

(add-hook  'csharp-mode-hook 'my-csharp-mode-fn t)
(add-hook 'csharp-mode-hook 'omnisharp-mode)

(setq auto-mode-alist (cons '("\\.cs" . maxima-mode) auto-mode-alist))
(provide 'init-csharp)

;;; init-csharp.el ends here
