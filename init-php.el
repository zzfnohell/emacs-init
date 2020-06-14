;;; init-php.el --- PHP MODE

;;; Commentary:
;; 

(use-package php-mode)

(defun init-php/php-mode-hook-func ()
  (require 'company-php)
  (setq-local company-backends '(company-ac-php-backend)))

(use-package company-php
  :config
  (add-hook 'php-mode-hook #'init-php/php-mode-hook-func))

(provide 'init-php)

;;; init-php.el ends here
