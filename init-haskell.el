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
  :after flycheck
  ;; Per flycheck-haskell README: configure on flycheck-mode-hook so Cabal /
  ;; Stack settings apply whenever Flycheck enables in a Haskell buffer.
  :hook (flycheck-mode . flycheck-haskell-setup))

(provide 'init-haskell)

;;; init-haskell.el ends here
