;;; init-csharp.el --- CSharp

;;; Commentary:
;; 


;;; Code:


(use-package csharp-mode
  :defer t
  :config
  (progn
    (defun init-csharp/csharp-mode-fn ()
      "function that runs when csharp-mode is initialized for a buffer."
      (turn-on-auto-revert-mode)
      (setq indent-tabs-mode nil)
      (yas-minor-mode-on))

    (autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)
    (setq auto-mode-alist (cons '("\\.cs" . csharp-mode) auto-mode-alist))
    (add-hook 'csharp-mode-hook 'init-csharp/csharp-mode-fn t)))



(use-package omnisharp
  :defer t
  :config
  (progn
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

    ;; (add-hook 'csharp-mode-hook 'omnisharp-mode)

    )
  )

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

(add-to-list
 'load-path
 (expand-file-name
  (concat
   (file-name-directory (or load-file-name buffer-file-name)) "/src/")))

(add-to-list
 'load-path
 (expand-file-name
  (concat
   (file-name-directory (or load-file-name buffer-file-name)) "/src/actions")))



(provide 'init-csharp)

;;; init-csharp.el ends here
