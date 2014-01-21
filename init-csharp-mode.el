(require 'cc-mode)
(require-package 'csharp-mode)
(autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)

(setq auto-mode-alist
      (append '(("\\.cs$" . csharp-mode)) auto-mode-alist))

(require-package 'yasnippet)
(defun my-csharp-mode-fn ()
     "function that runs when csharp-mode is initialized for a buffer."
     (turn-on-auto-revert-mode)
     (setq indent-tabs-mode nil)
     (yas-minor-mode-on))
  
(add-hook  'csharp-mode-hook 'my-csharp-mode-fn t)

(provide 'init-csharp-mode)
