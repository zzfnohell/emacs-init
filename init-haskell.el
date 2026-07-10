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

(provide 'init-haskell)

;;; init-haskell.el ends here
