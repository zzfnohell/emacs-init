;;; init-haskell.el --- Haskell

;;; Commentary:
;; 

;;; Code:

(use-package haskell-mode)

(use-package ghci-completion
  :config (add-hook 'inferior-haskell-mode-hook 'turn-on-ghci-completion))

(provide 'init-haskell)

;;; init-haskell.el ends here
