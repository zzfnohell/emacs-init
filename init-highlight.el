;;; init-highlight.el --- highlight



;;; Commentary:
;; 

;;; Code:

(require 'hl-line)

(use-package hl-anything
  :ensure t)

(use-package highlight-parentheses
  :ensure t)

(use-package highlight-thing
  :ensure t)

(use-package auto-highlight-symbol
  :ensure t
  :config
  (global-auto-highlight-symbol-mode t))

(provide 'init-highlight)

;;; init-highlight.el ends here
