;;; init-haskell.el --- Haskell

;;; Commentary:
;; 

;;; Code:

(use-package haskell-mode
  :ensure t
  :defer t
  :mode ("\\.hs\\'" "\\.lhs\\'" "\\.cabal\\'"))

(use-package flycheck-haskell
  :ensure t
  :hook
  (haskell-mode . flycheck-haskell-setup))

(use-package ghci-completion
  :ensure t
  :hook
  (inferior-haskell-mode . turn-on-ghci-completion))

(use-package dante
  :ensure t
  :defer t
  :after haskell-mode
  :commands dante-mode
  :hook (haskell-mode . dante-mode)
  :init
  (add-hook 'haskell-mode-hook 'flycheck-mode)
  ;; OR for flymake support:
  (add-hook 'haskell-mode-hook 'flymake-mode)
  (remove-hook 'flymake-diagnostic-functions 'flymake-proc-legacy-flymake)

  (add-hook 'haskell-mode-hook 'dante-mode)
  :config
  (flycheck-add-next-checker 'haskell-dante '(info . haskell-hlint)))

(use-package ormolu
  :ensure t
  :defer t
  :commands (ormolu ormolu-format-buffer ormolu-format-region) )

(provide 'init-haskell)

;;; init-haskell.el ends here
