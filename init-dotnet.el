;;; init-csharp.el --- CSharp

;;; Commentary:
;; 


;;; Code:
(use-package csproj-mode
  :ensure t
  :defer t)

(use-package fsharp-mode
  :ensure t
  :mode
  "\\.fs\\'"
  :config
  (require 'eglot-fsharp))

(use-package sharper
  :ensure t
  :defer t
  :bind
  ("C-c n" . sharper-main-transient))

(provide 'init-dotnet)

;;; init-dotnet.el ends here
