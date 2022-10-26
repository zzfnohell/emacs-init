;;; init-math.el --- Math

;;; Commentary:
;; 

(use-package maxima
  :ensure nil
  :defer t
  :mode (("\\.mac" . maxima-mode)
         ("\\.wxm" . maxima-mode))
  :config
  (require 'emaxima)
  (require 'imaxima))

(use-package frimacs
  :ensure t
  :defer t)

(use-package proof-general
	:ensure t
  :defer t)

(provide 'init-math)

;;; init-math.el ends here
