;;; init-math.el --- Math

;;; Commentary:
;; 

(use-package maxima
  :ensure nil
  :mode (("\\.mac" . maxima-mode)
         ("\\.wxm" . maxima-mode))
  :config
  (require 'emaxima)
  (require 'imaxima))

(use-package frimacs
  :ensure t
  :defer t)

(use-package proof-general
	:ensure t)

(provide 'init-math)

;;; init-math.el ends here
