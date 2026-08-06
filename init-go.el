;;; init-go.el --- GO

;;; Commentary:
;; 

;; 
;;; Code:

(use-package go-mode
  :ensure t
  :mode "\\.go\\'")

(use-package go-playground
  :ensure t
  :defer t
  :commands go-playground)

(message "[init] init-go loaded")

(provide 'init-go)

;;; init-go.el ends here
