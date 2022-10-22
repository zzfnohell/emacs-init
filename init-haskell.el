;;; init-haskell.el --- Haskell

;;; Commentary:
;; 

;;; Code:

(use-package haskell-mode
  :ensure t)

(use-package flycheck-haskell
  :ensure t
  :defer t
  :init
  (add-hook 'haskell-mode-hook #'flycheck-haskell-setup))

(use-package ghci-completion
  :ensure t
  :defer t
  :init
  (add-hook 'inferior-haskell-mode-hook 'turn-on-ghci-completion))

(use-package dante
  :ensure t
  :defer t
  :after haskell-mode
  :commands 'dante-mode
  :init
  (add-hook 'haskell-mode-hook 'flycheck-mode)
  ;; OR for flymake support:
  (add-hook 'haskell-mode-hook 'flymake-mode)
  (remove-hook 'flymake-diagnostic-functions 'flymake-proc-legacy-flymake)

  (add-hook 'haskell-mode-hook 'dante-mode)
  :config
  (flycheck-add-next-checker 'haskell-dante '(info . haskell-hlint)))

(provide 'init-haskell)

;;; init-haskell.el ends here
