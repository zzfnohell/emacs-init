;;; init-csharp.el --- CSharp

;;; Commentary:
;; 


;;; Code:


(use-package csharp-mode
	:ensure t
  :defer t
  :mode "\\.cs\\'"
  :config
  (autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)
  )
  


(defun init-csharp/csharp-mode-setup ()
  (omnisharp-mode)
  (company-mode)
  (flycheck-mode)

  (yas-minor-mode-on)
  (turn-on-auto-revert-mode)
  
  (setq indent-tabs-mode nil)
  (setq c-syntactic-indentation t)
  (c-set-style "ellemtel")
  (setq c-basic-offset 4)
  (setq truncate-lines t)
  (setq tab-width 4)
  (setq evil-shift-width 4)

  (electric-pair-local-mode 1) ;; Emacs 25

  (local-set-key (kbd "C-c r r") 'omnisharp-run-code-action-refactoring)
  (local-set-key (kbd "C-c C-c") 'recompile)
  )

;; CALL omnisharp-install-server
(use-package omnisharp
  :after csharp-mode
  :ensure t
  :defer t
  :config
  (add-hook 'csharp-mode-hook 'init-csharp/csharp-mode-setup t)
  )


(provide 'init-csharp)

;;; init-csharp.el ends here
